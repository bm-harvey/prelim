#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RENDERER="$SCRIPT_DIR/render_detectors.py"
SCENES_DIR="$SCRIPT_DIR/scenes"

echo "Regenerating all scenes..."
echo

for toml in "$SCENES_DIR"/*.toml; do
    name="$(basename "$toml" .toml)"
    echo ">>> $name"
    python3 "$RENDERER" --config "$toml"
    echo
done

echo "All scenes complete."
