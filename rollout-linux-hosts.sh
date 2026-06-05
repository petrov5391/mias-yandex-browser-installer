#!/usr/bin/env bash
set -euo pipefail

mode="check"
if [ "${1:-}" = "--install" ]; then
  mode="install"
elif [ "${1:-}" != "" ]; then
  echo "Usage: $0 [--install]" >&2
  exit 2
fi

install_cmd='curl -fsSL https://raw.githubusercontent.com/petrov5391/mias-yandex-browser-installer/main/install-user-from-github.sh | bash'

hosts=(
  "mias"
  "mias01"
  "ai-hp"
  "ai-samsung"
  "ai-asus-tail"
  "n15"
)

for host in "${hosts[@]}"; do
  echo "== $host =="
  if ! ssh -o BatchMode=yes -o ConnectTimeout=7 "$host" 'uname -s' >/tmp/mias-rollout-os.$$ 2>/tmp/mias-rollout-err.$$; then
    echo "ssh-unreachable"
    cat /tmp/mias-rollout-err.$$ | tail -3
    rm -f /tmp/mias-rollout-os.$$ /tmp/mias-rollout-err.$$
    continue
  fi

  os="$(cat /tmp/mias-rollout-os.$$)"
  rm -f /tmp/mias-rollout-os.$$ /tmp/mias-rollout-err.$$
  if [ "$os" != "Linux" ]; then
    echo "skip-non-linux: $os"
    continue
  fi

  if [ "$mode" = "install" ]; then
    ssh "$host" "$install_cmd"
  fi

  ssh "$host" 'set -e
    printf "host="; hostname 2>/dev/null || cat /proc/sys/kernel/hostname 2>/dev/null || true
    printf "user=%s\n" "$USER"
    if [ -x "$HOME/bin/yandex-browser-mias" ]; then
      grep "^ROOT=" "$HOME/bin/yandex-browser-mias"
      root="$(sed -n "s/^ROOT=\"\(.*\)\"/\1/p" "$HOME/bin/yandex-browser-mias")"
      "$HOME/bin/yandex-browser-mias" --version
      xdg-settings get default-web-browser 2>/dev/null || true
      sha256sum "$root/var/lib/yandex/browser-customization/partner_config" 2>/dev/null | awk "{print \"partner_config_sha256=\" \$1}" || true
    else
      echo "no-mias-wrapper"
    fi'
done

echo "Excluded by policy: hp-msk (Windows)"
