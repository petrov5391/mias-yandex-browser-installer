# MIAS Yandex Browser Installer

Public backup release for the custom MIAS Yandex Browser organization package.

## Download

Latest release asset:

```bash
curl -L -O https://github.com/petrov5391/mias-yandex-browser-installer/releases/download/v2026.06.05-mias-r2/yandex-browser-mias-installer-2026-06-05-r2.tar.zst
curl -L -O https://github.com/petrov5391/mias-yandex-browser-installer/releases/download/v2026.06.05-mias-r2/yandex-browser-mias-installer-2026-06-05-r2.tar.zst.sha256
sha256sum -c yandex-browser-mias-installer-2026-06-05-r2.tar.zst.sha256
```

Archive SHA256:

```text
55ad7225e41a852d719945642bd8837bb1140c3b234dacb116e086b45cf5538a
```

## System Install

```bash
tar --zstd -xf yandex-browser-mias-installer-2026-06-05-r2.tar.zst
cd yandex-browser-mias-installer
sudo ./install.sh
```

The installer verifies bundled package hashes, removes the regular `yandex-browser-stable` package when present, then installs the MIAS browser package and organization customization package.

## User Install

No sudo/root required:

```bash
tar --zstd -xf yandex-browser-mias-installer-2026-06-05-r2.tar.zst
cd yandex-browser-mias-installer
./install-user.sh
```

This creates `~/bin/yandex-browser-mias`, registers user desktop entries, sets HTTP/HTTPS/HTML defaults to `yandex-browser-mias.desktop`, and adds a desktop shortcut.
