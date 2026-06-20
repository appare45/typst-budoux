#!/bin/sh
set -eu

PACKAGE_PATH="$(typst info --format json | jq -r '.packages["package-path"]')"

curl -fsSL -o /tmp/typst-budoux.zip https://github.com/appare45/typst-budoux/releases/latest/download/typst-budoux.zip
rm -rf /tmp/typst-budoux
unzip -o /tmp/typst-budoux.zip -d /tmp/typst-budoux

VERSION="$(grep '^version' /tmp/typst-budoux/typst.toml | sed -E 's/version = "(.*)"/\1/')"
PKG_DIR="$PACKAGE_PATH/local/budoux/$VERSION"
mkdir -p "$PKG_DIR"
cp -r /tmp/typst-budoux/. "$PKG_DIR"

rm -rf /tmp/typst-budoux.zip /tmp/typst-budoux

echo "Installed @local/budoux:$VERSION"
echo "Use it with: #import \"@local/budoux:$VERSION\": segment"
