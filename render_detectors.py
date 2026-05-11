#!/usr/bin/env python3
"""
Render a 3D scene of detector squares from detnum_corner_z_x_y_r.txt.

Uses PyVista (VTK backend) for correct z-buffering and occlusion.

Viewing angles use standard physics spherical coordinates:
  theta : polar angle FROM the +Z axis (0=looking down, 90=side-on, 180=looking up).
  phi   : azimuthal angle around Z, measured from +X toward +Y.
  roll  : rotation of the camera around its own viewing axis.

Usage:
    python render_detectors.py [options]
    python render_detectors.py --config scene.toml

Options:
    --config FILE       TOML config file (CLI flags override config values)
    --input FILE        Input data file (default: detnum_corner_z_x_y_r.txt)
    --theta FLOAT       Polar angle from +Z in degrees (default: -120)
    --phi FLOAT         Azimuth angle in degrees (default: -10)
    --roll FLOAT        Roll around viewing axis in degrees (default: 100)
    --size WxH          Image size in pixels (default: 1200x900)
    --output NAME       Output base name without extension (default: detectors)
    --transparent       Render detectors semi-transparent
    --color             Color-code detectors by ring instead of grey
    --track THETA PHI [COLOR]  Draw a track (repeatable); COLOR is a name
                               (red, blue, green, black, grey, maroon) or
                               R,G,B (e.g. 255,128,0). Defaults to red.

Example config file (scene.toml):
    input       = "detnum_corner_z_x_y_r.txt"
    theta       = -120.0
    phi         = -10.0
    roll        = 100.0
    size        = "1200x900"
    output      = "detectors"
    color       = false
    transparent = false

    [[track]]
    theta = 15.0
    phi   = 0.0

    [[track]]
    theta = 30.0
    phi   = 45.0
"""

import argparse
import base64
import sys
import tomllib
from collections import defaultdict
from pathlib import Path

import numpy as np
import pyvista as pv

# Named track colors (RGB, 0–1 floats). Default is red.
NAMED_COLORS = {
    "red":    (0.9, 0.2, 0.2),
    "blue":   (0.2, 0.3, 0.9),
    "green":  (0.2, 0.75, 0.2),
    "black":  (0.0, 0.0, 0.0),
    "grey":   (0.5, 0.5, 0.5),
    "maroon": (0.5, 0.0, 0.0),
}
DEFAULT_TRACK_COLOR = "red"


def resolve_track_color(track):
    """
    Return an (r, g, b) tuple for a track dict.
    Priority: rgb list → color name → default red.
    rgb values are auto-scaled: ints > 1 are treated as 0–255.
    """
    if "rgb" in track:
        rgb = track["rgb"]
        if len(rgb) != 3:
            print(f"ERROR: rgb must have exactly 3 components, got {rgb}")
            sys.exit(1)
        # Scale 0-255 ints to 0-1 floats if any value exceeds 1
        if any(v > 1.0 for v in rgb):
            rgb = tuple(v / 255.0 for v in rgb)
        else:
            rgb = tuple(float(v) for v in rgb)
        return rgb
    name = track.get("color", DEFAULT_TRACK_COLOR).lower()
    if name not in NAMED_COLORS:
        print(f"ERROR: Unknown track color '{name}'. "
              f"Valid options: {', '.join(NAMED_COLORS)}.")
        sys.exit(1)
    return NAMED_COLORS[name]


def parse_args():
    parser = argparse.ArgumentParser(
        description="Render 3D detector geometry to PNG and SVG using PyVista.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("--config", metavar="FILE",
        help="TOML config file; CLI flags override config values")
    parser.add_argument("--input",       default=None)
    parser.add_argument("--theta",       type=float, default=None,
        help="Polar angle from +Z axis in degrees (default: -120)")
    parser.add_argument("--phi",         type=float, default=None,
        help="Azimuth angle around Z in degrees (default: -10)")
    parser.add_argument("--roll",        type=float, default=None,
        help="Roll around the viewing axis in degrees (default: 100)")
    parser.add_argument("--size",        default=None,
        help="Image size in pixels WxH (default: 1200x900)")
    parser.add_argument("--output",      default=None,
        help="Output base name without extension (default: detectors)")
    parser.add_argument("--transparent", action="store_true", default=False,
        help="Render detectors semi-transparent (default: opaque)")
    parser.add_argument("--color",       action="store_true", default=False,
        help="Color-code detectors by r-distance ring (default: grey)")
    parser.add_argument("--highlight-hits", action="store_true", default=False,
        help="Color hit detectors red (default: off)")
    parser.add_argument("--track", nargs="+", action="append",
        metavar="ARG",
        help="Draw a track: THETA PHI [COLOR]. COLOR is a name "
             "(red, blue, green, black, grey, maroon) or R,G,B. Repeatable.")
    cli = parser.parse_args()

    # Built-in defaults
    cfg = {
        "input":       "detnum_corner_z_x_y_r.txt",
        "theta":       -120.0,
        "phi":         -10.0,
        "roll":        100.0,
        "size":        "1200x900",
        "output":      "detectors",
        "transparent": False,
        "color":       False,
        "highlight_hits": False,
        "track":       [],
    }

    # Layer in config file
    if cli.config:
        config_path = Path(cli.config)
        if not config_path.exists():
            print(f"ERROR: Config file not found: {cli.config}")
            sys.exit(1)
        with open(config_path, "rb") as f:
            file_cfg = tomllib.load(f)
        for key in ("input", "theta", "phi", "roll", "size", "output",
                    "transparent", "color", "highlight_hits"):
            if key in file_cfg:
                cfg[key] = file_cfg[key]
        for t in file_cfg.get("track", []):
            track = {"theta": float(t["theta"]), "phi": float(t["phi"])}
            if "rgb" in t:
                track["rgb"] = t["rgb"]
            elif "color" in t:
                track["color"] = t["color"]
            cfg["track"].append(track)

    # Layer in CLI overrides
    if cli.input   is not None: cfg["input"]   = cli.input
    if cli.theta   is not None: cfg["theta"]   = cli.theta
    if cli.phi     is not None: cfg["phi"]     = cli.phi
    if cli.roll    is not None: cfg["roll"]    = cli.roll
    if cli.size    is not None: cfg["size"]    = cli.size
    if cli.output  is not None: cfg["output"]  = cli.output
    if cli.transparent:         cfg["transparent"] = True
    if cli.color:               cfg["color"]   = True
    if cli.highlight_hits:      cfg["highlight_hits"] = True
    if cli.track:
        for args in cli.track:
            if len(args) < 2 or len(args) > 3:
                print("ERROR: --track requires THETA PHI [COLOR]")
                sys.exit(1)
            track = {"theta": float(args[0]), "phi": float(args[1])}
            if len(args) == 3:
                color_arg = args[2]
                if "," in color_arg:
                    parts = color_arg.split(",")
                    if len(parts) != 3:
                        print(f"ERROR: RGB color must have 3 components, got '{color_arg}'")
                        sys.exit(1)
                    track["rgb"] = [float(p) for p in parts]
                else:
                    track["color"] = color_arg
            cfg["track"].append(track)

    return cfg

def parse_size(size_str):
    try:
        w, h = size_str.lower().split("x")
        return int(w), int(h)
    except (ValueError, AttributeError):
        print(f"ERROR: Invalid size '{size_str}'. Expected WxH, e.g. 1200x900.")
        sys.exit(1)


def load_detectors(filepath):
    detectors = defaultdict(dict)
    det_r = {}
    with open(filepath) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            parts = line.split()
            if len(parts) < 6:
                continue
            det_id = int(parts[0])
            corner = int(parts[1])
            z = float(parts[2])
            x = float(parts[3])
            y = float(parts[4])
            r = float(parts[5])
            detectors[det_id][corner] = (x, y, z)
            det_r[det_id] = r
    quads = {}
    for det_id, corners in detectors.items():
        if len(corners) == 4:
            quads[det_id] = [corners[c] for c in sorted(corners)]
    return quads, det_r


def make_color_map(det_r, use_color):
    if not use_color:
        return {det_id: (0.6, 0.6, 0.6) for det_id in det_r}
    import matplotlib
    unique_r = sorted(set(det_r.values()))
    cmap = matplotlib.colormaps.get_cmap("tab10").resampled(len(unique_r))
    r_to_idx = {r: i for i, r in enumerate(unique_r)}
    return {det_id: cmap(r_to_idx[r])[:3] for det_id, r in det_r.items()}


def compute_camera(theta_deg, phi_deg, roll_deg, focal_point, distance):
    """
    Returns (position, up_vector) for the PyVista camera.
    theta: polar angle from +Z (physics convention)
    phi:   azimuth from +X toward +Y
    roll:  rotation around the viewing axis
    """
    theta = np.radians(theta_deg)
    phi = np.radians(phi_deg)

    # Camera direction unit vector (from focal point toward camera)
    dx = np.sin(theta) * np.cos(phi)
    dy = np.sin(theta) * np.sin(phi)
    dz = np.cos(theta)
    cam_dir = np.array([dx, dy, dz])

    position = np.array(focal_point) + distance * cam_dir

    # Build an up vector perpendicular to cam_dir, then apply roll
    world_up = np.array([0.0, 0.0, 1.0])
    right = np.cross(cam_dir, world_up)
    if np.linalg.norm(right) < 1e-6:
        world_up = np.array([0.0, 1.0, 0.0])
        right = np.cross(cam_dir, world_up)
    right /= np.linalg.norm(right)
    up = np.cross(right, cam_dir)  # already unit since cam_dir and right are unit+perp
    up /= np.linalg.norm(up)

    roll_rad = np.radians(roll_deg)
    up_rolled = up * np.cos(roll_rad) + right * np.sin(roll_rad)

    return position, up_rolled


def ray_triangle_intersect(origin, direction, v0, v1, v2):
    """
    Möller–Trumbore ray-triangle intersection.
    Returns t (distance along ray) if hit, else None.
    """
    EPS = 1e-8
    edge1 = v1 - v0
    edge2 = v2 - v0
    h = np.cross(direction, edge2)
    a = np.dot(edge1, h)
    if abs(a) < EPS:
        return None  # parallel
    f = 1.0 / a
    s = origin - v0
    u = f * np.dot(s, h)
    if u < 0.0 or u > 1.0:
        return None
    q = np.cross(s, edge1)
    v = f * np.dot(direction, q)
    if v < 0.0 or u + v > 1.0:
        return None
    t = f * np.dot(edge2, q)
    return t if t > EPS else None


def ray_quad_intersect(origin, direction, corners):
    """
    Test a ray against a quad (4 corners, split into 2 triangles).
    Returns the hit distance t, or None.
    """
    pts = [np.array(c, dtype=float) for c in corners]
    # Split quad into triangles: (0,1,2) and (0,2,3)
    t1 = ray_triangle_intersect(origin, direction, pts[0], pts[1], pts[2])
    t2 = ray_triangle_intersect(origin, direction, pts[0], pts[2], pts[3])
    hits = [t for t in (t1, t2) if t is not None]
    return min(hits) if hits else None


def track_endpoint(track_theta_deg, track_phi_deg, quads):
    """
    Shoot a ray from origin in direction (theta, phi) and find the closest
    detector quad it hits. Returns (endpoint, hit_det_id_or_None).
    """
    theta = np.radians(track_theta_deg)
    phi = np.radians(track_phi_deg)
    origin = np.array([0.0, 0.0, 0.0])
    direction = np.array([
        np.sin(theta) * np.cos(phi),
        np.sin(theta) * np.sin(phi),
        np.cos(theta),
    ])

    best_t = None
    best_id = None
    for det_id, corners in quads.items():
        t = ray_quad_intersect(origin, direction, corners)
        if t is not None and (best_t is None or t < best_t):
            best_t = t
            best_id = det_id

    if best_t is not None:
        return origin + best_t * direction, best_id
    else:
        all_z = [c[2] for corners in quads.values() for c in corners]
        max_reach = max(abs(min(all_z)), abs(max(all_z))) * 1.1
        return origin + max_reach * direction, None


def render(quads, det_r, theta, phi, roll, img_size, output_base, use_color, tracks, transparent, highlight_hits):
    colors = make_color_map(det_r, use_color)

    # Find all hit detector IDs up front so we can recolor them
    hit_ids = set()
    if highlight_hits and tracks:
        for track in tracks:
            _, det_id = track_endpoint(track["theta"], track["phi"], quads)
            if det_id is not None:
                hit_ids.add(det_id)

    all_pts = np.array([pt for corners in quads.values() for pt in corners])
    focal = all_pts.mean(axis=0)
    span = (all_pts.max(axis=0) - all_pts.min(axis=0)).max()
    distance = span * 2.2

    pv.OFF_SCREEN = True
    pl = pv.Plotter(off_screen=True, window_size=list(img_size))
    pl.set_background("white")

    # --- Detector quads ---
    for det_id, corners in quads.items():
        pts = np.array(corners, dtype=float)
        faces = np.array([4, 0, 1, 2, 3])
        mesh = pv.PolyData(pts, faces)
        c = (0.25, 0.35, 0.65) if det_id in hit_ids else colors[det_id]
        pl.add_mesh(mesh, color=c, opacity=0.5 if transparent else 1.0,
                    show_edges=True, edge_color="black", line_width=2.5,
                    lighting=False)

    # --- Z-axis beam line (tube, same radius as beam arrow shaft) ---
    z_min_line = -6.0
    z_max_line = all_pts[:, 2].max() + 3.0
    beam_arrow_shaft_r  = 0.15
    beam_arrow_tip_cm   = 1.2
    beam_arrow_tip_r    = 0.4
    beam_arrow_length   = 4.0
    line = pv.Line((0, 0, z_min_line), (0, 0, z_max_line))
    pl.add_mesh(line.tube(radius=beam_arrow_shaft_r), color="black", lighting=False)
    tip_z = z_min_line / 2          # halfway between z_min_line and 0
    beam_arrow_start_z  = tip_z - beam_arrow_length
    beam_arrow = pv.Arrow(
        start=(0.0, 0.0, beam_arrow_start_z),
        direction=(0.0, 0.0, 1.0),
        scale=beam_arrow_length,
        tip_length=beam_arrow_tip_cm   / beam_arrow_length,
        tip_radius=beam_arrow_tip_r    / beam_arrow_length,
        shaft_radius=beam_arrow_shaft_r / beam_arrow_length,
    )
    pl.add_mesh(beam_arrow, color="black", lighting=False)

    # --- Origin disc in XY plane, r = 5/8 inch ---
    circle_r = (5.0 / 8.0) * 2.54 / 2  # 5/8 inch diameter → radius in cm
    angles = np.linspace(0, 2 * np.pi, 256, endpoint=False)
    perimeter = np.column_stack([
        circle_r * np.cos(angles),
        circle_r * np.sin(angles),
        np.zeros(len(angles)),
    ])
    center_pt = np.array([[0.0, 0.0, 0.0]])
    disc_pts = np.vstack([center_pt, perimeter])
    n = len(angles)
    faces_list = []
    for i in range(n):
        faces_list += [3, 0, 1 + i, 1 + (i + 1) % n]
    disc = pv.PolyData(disc_pts, np.array(faces_list))
    pl.add_mesh(disc, color=(0.25, 0.25, 0.25), opacity=1.0, lighting=False)

    # --- Tracks ---
    for track in (tracks or []):
        track_theta = track["theta"]
        track_phi   = track["phi"]
        endpoint, hit_id = track_endpoint(track_theta, track_phi, quads)
        color = resolve_track_color(track)

        length = float(np.linalg.norm(endpoint))
        direction = endpoint / length

        # Fixed absolute sizes in cm regardless of track length
        tip_len_cm    = 1.2
        tip_rad_cm    = 0.4
        shaft_rad_cm  = 0.15

        arrow = pv.Arrow(
            start=(0.0, 0.0, 0.0),
            direction=direction,
            scale=length,
            tip_length=tip_len_cm / length,
            tip_radius=tip_rad_cm / length,
            shaft_radius=shaft_rad_cm / length,
        )
        pl.add_mesh(arrow, color=color, lighting=False)

        if hit_id is not None:
            print(f"  Track θ={track_theta}° φ={track_phi}°: hit detector {hit_id} at "
                  f"({endpoint[0]:.2f}, {endpoint[1]:.2f}, {endpoint[2]:.2f}) cm")
        else:
            print(f"  Track θ={track_theta}° φ={track_phi}°: no detector hit")

    # --- Camera ---
    cam_pos, cam_up = compute_camera(theta, phi, roll, focal, distance)
    pl.camera.position = cam_pos
    pl.camera.focal_point = focal
    pl.camera.up = cam_up
    pl.camera.view_angle = 35.0

    # --- Save PNG ---
    png_path = f"{output_base}.png"
    pl.screenshot(png_path, transparent_background=True)
    pl.close()
    print(f"Saved: {png_path}")

    # --- Save SVG (PNG embedded in SVG wrapper) ---
    w, h = img_size
    svg_path = f"{output_base}.svg"
    with open(png_path, "rb") as f:
        b64 = base64.b64encode(f.read()).decode("ascii")
    svg = (
        f'<svg xmlns="http://www.w3.org/2000/svg" '
        f'xmlns:xlink="http://www.w3.org/1999/xlink" '
        f'width="{w}" height="{h}" viewBox="0 0 {w} {h}">\n'
        f'  <image href="data:image/png;base64,{b64}" '
        f'x="0" y="0" width="{w}" height="{h}"/>\n'
        f'</svg>\n'
    )
    with open(svg_path, "w") as f:
        f.write(svg)
    print(f"Saved: {svg_path}")


def main():
    cfg = parse_args()
    img_size = parse_size(cfg["size"])

    input_path = Path(cfg["input"])
    if not input_path.exists():
        print(f"ERROR: File not found: {input_path}")
        sys.exit(1)

    print(f"Loading detectors from: {input_path}")
    quads, det_r = load_detectors(input_path)
    print(f"  {len(quads)} detectors loaded")

    render(quads, det_r,
           theta=cfg["theta"], phi=cfg["phi"], roll=cfg["roll"],
           img_size=img_size, output_base=cfg["output"],
           use_color=cfg["color"], tracks=cfg["track"],
           transparent=cfg["transparent"], highlight_hits=cfg["highlight_hits"])


if __name__ == "__main__":
    main()
