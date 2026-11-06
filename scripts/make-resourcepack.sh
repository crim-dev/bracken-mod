#!/usr/bin/env bash

set -euo pipefail

if [ ! -f "scripts/make-resourcepack.sh" ]; then
    echo "This script must be run from the root of the repository."
    exit 1
fi