#!/usr/bin/env bash

set -euo pipefail

if [ ! -f "scripts/make-resourcepack.sh" ]; then
    echo "This script must be run from the root of the repository."
    exit 1
fi

cd ./assets

zip bprp_dev.zip -r \
  pack.mcmeta pack.png pack_16.png assets \

cd ../

COMMIT_HASH=$(cd assets && git rev-parse --short HEAD)

mv assets/bprp_dev.zip ./build/bprp_dev-$COMMIT_HASH.zip