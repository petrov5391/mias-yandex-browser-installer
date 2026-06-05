#!/usr/bin/env bash
set -euo pipefail

repo="petrov5391/mias-yandex-browser-installer"
tag="v2026.06.05-mias-r4"
asset="yandex-browser-mias-installer-2026-06-05-r4.tar.zst"
base_url="https://github.com/${repo}/releases/download/${tag}"
workdir="${TMPDIR:-/tmp}/mias-yandex-browser-installer-${tag}"

need() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Missing required command: $1" >&2
    exit 1
  }
}

need curl
need sha256sum
need tar

rm -rf "$workdir"
mkdir -p "$workdir"
cd "$workdir"

curl -fL -O "${base_url}/${asset}"
curl -fL -O "${base_url}/${asset}.sha256"
sha256sum -c "${asset}.sha256"

tar --zstd -xf "$asset"
cd yandex-browser-mias-installer
./install-user.sh
