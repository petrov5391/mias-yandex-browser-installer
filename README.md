# MIAS Yandex Browser Installer

Public backup release for the custom MIAS Yandex Browser organization package.

## Download

Latest release asset:

```bash
curl -L -O https://github.com/petrov5391/mias-yandex-browser-installer/releases/download/v2026.06.05-mias/yandex-browser-mias-installer-2026-06-05.tar.zst
curl -L -O https://github.com/petrov5391/mias-yandex-browser-installer/releases/download/v2026.06.05-mias/yandex-browser-mias-installer-2026-06-05.tar.zst.sha256
sha256sum -c yandex-browser-mias-installer-2026-06-05.tar.zst.sha256
```

Archive SHA256:

```text
045a2115a62600f8417bfcbd226111f7dc9a6cc0bf149cd06ac1ea4a9cdf461b
```

## Install

```bash
tar --zstd -xf yandex-browser-mias-installer-2026-06-05.tar.zst
cd yandex-browser-mias-installer
sudo ./install.sh
```

The installer verifies bundled package hashes, removes the regular `yandex-browser-stable` package when present, then installs the MIAS browser package and organization customization package.
