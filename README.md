# MIAS Yandex Browser Installer

Public backup release for the custom MIAS Yandex Browser organization package.

Machine-readable current release metadata: [`current-release.json`](current-release.json).

## Download

Latest release asset:

```bash
curl -L -O https://github.com/petrov5391/mias-yandex-browser-installer/releases/download/v2026.06.05-mias-r4/yandex-browser-mias-installer-2026-06-05-r4.tar.zst
curl -L -O https://github.com/petrov5391/mias-yandex-browser-installer/releases/download/v2026.06.05-mias-r4/yandex-browser-mias-installer-2026-06-05-r4.tar.zst.sha256
sha256sum -c yandex-browser-mias-installer-2026-06-05-r4.tar.zst.sha256
```

Archive SHA256:

```text
01e32bab7178b819ee3f98a4a5de2ab736e2eb7771bad297afe2e80e3533c6e2
```

## System Install

```bash
tar --zstd -xf yandex-browser-mias-installer-2026-06-05-r4.tar.zst
cd yandex-browser-mias-installer
sudo ./install.sh
```

The installer verifies bundled package hashes, removes the regular `yandex-browser-stable` package when present, then installs the MIAS browser package and organization customization package.

## User Install

No sudo/root required:

```bash
tar --zstd -xf yandex-browser-mias-installer-2026-06-05-r4.tar.zst
cd yandex-browser-mias-installer
./install-user.sh
```

This creates `~/bin/yandex-browser-mias`, registers user desktop entries, sets HTTP/HTTPS/HTML defaults to `yandex-browser-mias.desktop`, and adds a desktop shortcut.

One-command user install from GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/petrov5391/mias-yandex-browser-installer/main/install-user-from-github.sh | bash
```

## Verified

Checked on 2026-06-05:

- Source backup: `YandexBrowser[MIAS].zip` from `ai-asus`.
- Package contents: `yandex-browser-corporate 26.3.5.855-1` and `yandex-browser-customisation 0.2606.0518.2337`.
- Public release asset: `v2026.06.05-mias-r4`, size `193142748` bytes.
- `mias01` user install: `mias` and `mias01` both run `Yandex 26.3.5.855` from `~/.local/opt/yandex-browser-mias`.
- `mias01` GUI smoke: browser starts from the user install and exposes corporate policy markers.
- `ai-hp` Arch smoke: user-mode install works without `dpkg-deb` through the `ar`/`bsdtar` fallback and reports `Yandex 26.3.5.855`.
- r4 archive README is current and documents the non-Debian user-mode extraction path.

On `mias01`, the regular system package `yandex-browser-stable` is still installed until an administrator password is available for a full system replacement. The user install is already selected as the default browser through `xdg-settings`.

Network note: `ai-hp` and `hp-msk` are separate Tailnet machines. `ai-hp` is registered separately as `ai-hp` at `100.64.0.7`; `hp-msk` is `100.64.0.6`.
