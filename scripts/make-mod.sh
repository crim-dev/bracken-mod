#!/usr/bin/env bash

set -euo pipefail

if [[ ! -f "scripts/make-mod.sh" ]]; then
    echo "This script must be run from the root of the repository."
    exit 1
fi

# Create copy of relevant files in temporary directory and build from there

ROOT_DIR=$(pwd -P)
WORKDIR=$(mktemp -d)
trap 'rm -rf "$WORKDIR"' EXIT

BUILD_DIR="$ROOT_DIR/build"
mkdir -p "$BUILD_DIR"

rm -f "$BUILD_DIR/thebrackenpack_dev.jar"

ln -s "$ROOT_DIR/assets/assets" "$WORKDIR/assets"
ln -s "$ROOT_DIR/datapack/data" "$WORKDIR/data"

for f in "$ROOT_DIR"/metadata/*; do
    [[ -e "$f" ]] || continue
    ln -s "$f" "$WORKDIR/$(basename "$f")"
done

(
    cd "$WORKDIR"
    zip -r "$BUILD_DIR/thebrackenpack_dev.jar" .
)