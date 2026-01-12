#!/bin/bash

set -eufo pipefail

if [ -n "${CI:-}" ]; then
  echo "Skip chsh in CI"
  exit 0
fi

chsh -s $(which zsh)
