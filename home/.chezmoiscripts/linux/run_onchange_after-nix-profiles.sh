#!/bin/bash

set -eufo pipefail

if [ -n "${CI:-}" ]; then
  echo "Skip home-manager in CI"
  exit 0
fi

nix run home-manager/master -- switch --flake "$CHEZMOI_SOURCE_DIR"#gin
