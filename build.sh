#!/usr/bin/env bash
# Packages the mod into build/<name>_<version>.zip as the mod portal expects.
set -euo pipefail

cd "$(dirname "$0")"

name=$(grep -o '"name"[[:space:]]*:[[:space:]]*"[^"]*"' info.json | head -1 | cut -d'"' -f4)
version=$(grep -o '"version"[[:space:]]*:[[:space:]]*"[^"]*"' info.json | head -1 | cut -d'"' -f4)
folder="${name}_${version}"

rm -rf "build/${folder}" "build/${folder}.zip"
mkdir -p "build/${folder}"

cp -r info.json control.lua settings.lua changelog.txt thumbnail.png locale LICENSE "build/${folder}/"

(cd build && zip -qr "${folder}.zip" "${folder}")
rm -rf "build/${folder}"

echo "build/${folder}.zip"
