# Linux Rollout Status

Checked on 2026-06-05.

## Installed

| Host | Tailnet IP | User | Install root | Version | Default browser |
| --- | --- | --- | --- | --- | --- |
| `mias01` | `100.64.0.1` | `mias` | `/home/buh/.local/opt/yandex-browser-mias` | `Yandex 26.3.5.855` | `yandex-browser-mias.desktop` |
| `mias01` | `100.64.0.1` | `mias01` | `/home/mias01/.local/opt/yandex-browser-mias` | `Yandex 26.3.5.855` | `yandex-browser-mias.desktop` |
| `ai-hp` | `100.64.0.7` | `user` | `/home/user/.local/opt/yandex-browser-mias` | `Yandex 26.3.5.855` | `yandex-browser-mias.desktop` |
| `ai-samsung` | `100.64.0.5` | `ai-samsung` | `/home/ai-samsung/.local/opt/yandex-browser-mias` | `Yandex 26.3.5.855` | `yandex-browser-mias.desktop` |

## Pending

These Linux hosts were offline in Headscale and were not modified:

| Host | Tailnet IP | Status |
| --- | --- | --- |
| `ai-asus` | `100.64.0.3` | offline |
| `n15` | `100.64.0.4` | offline |

## Excluded

`hp-msk` is a Windows host at `100.64.0.6` and is intentionally excluded from this Linux-only rollout.

## Install Command

For online Linux hosts:

```bash
curl -fsSL https://raw.githubusercontent.com/petrov5391/mias-yandex-browser-installer/main/install-user-from-github.sh | bash
```
