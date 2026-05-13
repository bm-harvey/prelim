#import "@preview/cetz:0.5.0": canvas, draw
#import "@preview/physica:0.9.3": isotope

#let si28 = $isotope("Si", a: 28)$

#let panel-box(body) = box(stroke: black, inset: 6pt, radius: 14pt, body)

#let reaction-cartoon() = [
  #grid(
    columns: (auto, auto, auto, auto, auto),
    align: horizon,
    gutter: 4pt,

    // ── Panel 1: Approaching ────────────────────────────────
    panel-box[#canvas(length: 1cm, {
      import draw: *
      let r-si = 1.06
      let r-c = 0.80
      let x-si = -.2
      let x-c = 2.0
      let offset = 1
      line(
        (x-si, offset),
        (x-si + r-si + 1.15, offset),
        mark: (end: ">", size: 0.3),
        stroke: gray.darken(30%) + 1pt,
      )
      circle((x-si, offset), radius: r-si, fill: red.lighten(60%), stroke: red.darken(25%) + 1.5pt)
      content((x-si, offset), si28)
      circle((x-c, 0), radius: r-c, fill: gray.lighten(60%), stroke: gray.darken(25%) + 1.5pt)
      content((x-c, 0), text(size:14pt, [Target]))
    })],

    // Arrow between panels
    text(size: 20pt)[$arrow.r$],

    // ── Panel 2: Interacting (overlapping) ──────────────────
    panel-box[#canvas(length: 1cm, {
      import draw: *
      let r-si = 1.06
      let r-c = 0.80
      let x-si = -.2
      let x-c = 2.0
      // C-12 drawn first (behind)
      line((1.6, 1), (1.5 + 1.15, 1), mark: (end: ">", size: 0.3), stroke: gray.darken(30%) + 1pt)
      circle((1.6, 0.0), radius: r-c, fill: gray.lighten(60%), stroke: gray.darken(25%) + 1.5pt)
      // content((1.6, 0.0), c12)
      // Si-28 overlapping on top
      circle((0.8, 1.0), radius: r-si, fill: red.lighten(60%), stroke: red.darken(25%) + 1.5pt)
      // content((0.8, 0.5), si28)
    })],

    // Arrow between panels
    text(size: 20pt)[$arrow.r$],

    // ── Panel 3: Excited toroidal Si28 leaving ──────────────
    panel-box[#canvas(length: 1cm, {
      import draw: *
      let r-si = 1.06
      let r-c = 0.80
      // C-12 on left (target, remains)
      circle((0.8, 0.0), radius: r-c, fill: gray.lighten(60%), stroke: gray.darken(25%) + 1.5pt)
      // content((0.8, 0.0), c12)
      // Torus Si28 on right: outer filled + inner white hole
      let x-tor = 2.9
      circle((x-tor, 1.0), radius: r-si, fill: red.lighten(60%), stroke: red.darken(25%) + 1.5pt)
      circle((x-tor, 1.0), radius: r-si * 0.40, fill: white, stroke: red.darken(25%) + 1pt)
      content((x-tor, 1.6), $si28^*$)
      // Exit arrow
      line(
        (x-tor + r-si + 0.15, 1.0),
        (x-tor + r-si + 1.1, .9),
        mark: (end: ">", size: 0.3),
        stroke: gray.darken(30%) + 1pt,
      )
    })],
  )

  #v(-1em)
  #grid(
    columns: (auto, auto),
    align: horizon,
    gutter: 4pt,
    text(size: 20pt)[$arrow.r$],
    panel-box[#canvas(length: 1cm, {
      import draw: *
      let r-c = 0.80
      let r-alpha = 0.42
      // C-12 on left (same as panel 3)
      circle((-2, 0.0), radius: r-c, fill: gray.lighten(60%), stroke: gray.darken(25%) + 1.5pt)
      // content((0.8, 0.0), c12)
      // 7 alpha particles arranged in a circle where the torus was
      let cx = 2.9
      let cy = 1.0
      let r-dist = 1.0
      for i in range(7) {
        let angle = 2 * calc.pi * i / 7
        let ax = cx + r-dist * calc.cos(angle)
        let ay = cy + r-dist * calc.sin(angle)
        circle((ax, ay), radius: r-alpha, fill: red.lighten(60%), stroke: red.darken(30%) + 1.5pt)
        content((ax, ay), $alpha$)
      }
      for i in range(7) {
        let angle = 2 * calc.pi * i / 7
        let ax = cx + r-dist * calc.cos(angle)
        let ay = cy + r-dist * calc.sin(angle)
        // Velocity vector — pointing nearly rightward (±20° spread)
        let max-spread = calc.pi / 9
        let vel-angle = -max-spread + i * (2 * max-spread / 6)
        line(
          (ax + (r-alpha + 0.15) * calc.cos(vel-angle), ay + (r-alpha + 0.15) * calc.sin(vel-angle)),
          (ax + (r-alpha + 1.1) * calc.cos(vel-angle), ay + (r-alpha + 1.1) * calc.sin(vel-angle)),
          mark: (end: ">", size: 0.3),
          stroke: gray.darken(30%) + 1pt,
        )
      }
      // Detector arc to the right
      arc((cx + 4, -2.75), start: -55deg, stop: 55deg, radius: 3.5, mode: "OPEN", stroke: black + 2pt)
      content((cx + 6, cy), anchor: "west", [Detectors])
    })],
  )
]
