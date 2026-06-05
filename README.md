# MIAS Yandex Browser Installer

Public backup release for the custom MIAS Yandex Browser organization package.

## Download

Latest release asset:

```bash
curl -L -O https://github.com/petrov5391/mias-yandex-browser-installer/releases/download/v2026.06.05-mias-r3/yandex-browser-mias-installer-2026-06-05-r3.tar.zst
curl -L -O https://github.com/petrov5391/mias-yandex-browser-installer/releases/download/v2026.06.05-mias-r3/yandex-browser-mias-installer-2026-06-05-r3.tar.zst.sha256
sha256sum -c yandex-browser-mias-installer-2026-06-05-r3.tar.zst.sha256
```

Archive SHA256:

```text
9b7af1dd20321d8bcaf3faa2d949eab0a3e30994bd462019933860dbaf2d17e9
```

## System Install

```bash
tar --zstd -xf yandex-browser-mias-installer-2026-06-05-r3.tar.zst
cd yandex-browser-mias-installer
sudo ./install.sh
```

The installer verifies bundled package hashes, removes the regular `yandex-browser-stable` package when present, then installs the MIAS browser package and organization customization package.

## User Install

No sudo/root required:

```bash
tar --zstd -xf yandex-browser-mias-installer-2026-06-05-r3.tar.zst
cd yandex-browser-mias-installer
./install-user.sh
```

This creates `~/bin/yandex-browser-mias`, registers user desktop entries, sets HTTP/HTTPS/HTML defaults to `yandex-browser-mias.desktop`, and adds a desktop shortcut.

## Verified

Checked on 2026-06-05:

- Source backup: `YandexBrowser[MIAS].zip` from `ai-asus`.
- Package contents: `yandex-browser-corporate 26.3.5.855-1` and `yandex-browser-customisation 0.2606.0518.2337`.
- Public release asset: `v2026.06.05-mias-r3`, size `193142545` bytes.
- `mias01` user install: `mias` and `mias01` both run `Yandex 26.3.5.855` from `~/.local/opt/yandex-browser-mias`.
- `mias01` GUI smoke: browser starts from the user install and exposes corporate policy markers.
- `ai-hp` Arch smoke: user-mode install works without `dpkg-deb` through the `ar`/`bsdtar` fallback and reports `Yandex 26.3.5.855`.

On `mias01`, the regular system package `yandex-browser-stable` is still installed until an administrator password is available for a full system replacement. The user install is already selected as the default browser through `xdg-settings`.

Network note: `ai-hp` and `hp-msk` are separate Tailnet machines. `ai-hp` is registered separately as `ai-hp` at `100.64.0.7`; `hp-msk` is `100.64.0.6`.
