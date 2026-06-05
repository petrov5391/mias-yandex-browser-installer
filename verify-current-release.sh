#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

download=0
if [ "${1:-}" = "--download" ]; then
  download=1
elif [ "${1:-}" != "" ]; then
  echo "Usage: $0 [--download]" >&2
  exit 2
fi

need() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Missing required command: $1" >&2
    exit 1
  }
}

need curl
need jq

manifest="current-release.json"
tag="$(jq -r '.current_tag' "$manifest")"
asset_url="$(jq -r '.asset.url' "$manifest")"
sha256_url="$(jq -r '.asset.sha256_url' "$manifest")"
expected_sha="$(jq -r '.asset.sha256' "$manifest")"
expected_size="$(jq -r '.asset.size_bytes' "$manifest")"

test "$tag" != "null"
test "$asset_url" != "null"
test "$sha256_url" != "null"
test "$expected_sha" != "null"
test "$expected_size" != "null"

published_sha="$(curl -fsSL "$sha256_url" | awk '{print $1}')"
if [ "$published_sha" != "$expected_sha" ]; then
  echo "SHA mismatch: manifest=$expected_sha published=$published_sha" >&2
  exit 1
fi

headers="$(curl -fsSIL -L "$asset_url")"
content_length="$(printf '%s\n' "$headers" | awk 'BEGIN{IGNORECASE=1} /^content-length:/ {value=$2} END{gsub("\r", "", value); print value}')"
if [ "$content_length" != "$expected_size" ]; then
  echo "Size mismatch: manifest=$expected_size published=$content_length" >&2
  exit 1
fi

if [ "$download" -eq 1 ]; then
  need sha256sum
  tmpdir="$(mktemp -d)"
  trap 'rm -rf "$tmpdir"' EXIT
  asset_name="$(jq -r '.asset.name' "$manifest")"
  curl -fL -o "$tmpdir/$asset_name" "$asset_url"
  actual_sha="$(sha256sum "$tmpdir/$asset_name" | awk '{print $1}')"
  if [ "$actual_sha" != "$expected_sha" ]; then
    echo "Downloaded SHA mismatch: manifest=$expected_sha actual=$actual_sha" >&2
    exit 1
  fi
fi

echo "OK $tag $expected_sha $expected_size"
