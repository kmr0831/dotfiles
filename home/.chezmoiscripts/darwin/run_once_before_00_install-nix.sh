#!/bin/bash

set -eufo pipefail

main() {
  if command -v nix >/dev/null 2>&1; then
    echo "Nix already installed"

    # Check for updates
    # if command -v determinate-nixd >/dev/null 2>&1; then
    #   echo "checking for updates..."
    #   sudo determinate-nixd upgrade
    # fi
    return 0
  fi

  curl -fsSL https://install.determinate.systems/nix | sh -s -- install
}

main
