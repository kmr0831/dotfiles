#!/bin/bash

set -eufo pipefail

has_bw() {
  command -v bw >/dev/null 2>&1
}

login_bitwarden() {
  bw login --check > /dev/null || bw login "${BITWARDEN_EMAIL:-}"
}

main() {
  if [ -n "${BW_SESSION:-}" ]; then
    echo "The BW_SESSION environment variable is already set."
    exit 0
  fi

  if has_bw; then
    login_bitwarden
  fi
}

main
