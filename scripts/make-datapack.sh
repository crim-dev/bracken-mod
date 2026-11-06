#!/usr/bin/env bash

set -euo pipefail

if [ ! -f "scripts/make-datapack.sh" ]; then
    echo "This script must be run from the root of the repository."
    exit 1
fi

cd ./datapack

zip thebrackenpack_dev.zip -r \
  ./data pack.mcmeta pack.png "SPECIAL THANKS.md" \

cd ../

COMMIT_HASH=$(cd datapack && git rev-parse --short HEAD)

mv datapack/thebrackenpack_dev.zip ./build/thebrackenpack_dev-$COMMIT_HASH.zip