#!/bin/bash

set -eufo pipefail

has_bw() {
  command -v bw >/dev/null 2>&1
}

login_bitwarden() {
  if [ -n "${BW_SESSION:-}" ]; then
    exit 0
  fi

  bw login --check > /dev/null || bw login "${BITWARDEN_EMAIL:-}"
}

main() {
  if has_bw; then
    login_bitwarden
  else
    echo "bw is not installed. Installing Bitwarden CLI."
  fi
}

main
