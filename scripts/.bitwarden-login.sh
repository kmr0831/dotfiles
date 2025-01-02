#!/bin/bash

# シェルスクリプト内で export した環境変数は読めない: https://github.com/twpayne/chezmoi/issues/3729
# 代替案: https://github.com/twpayne/chezmoi/discussions/3202

set -eufo pipefail

if ! command -v bw &> /dev/null; then
  echo "bw is not installed"
  exit 0
fi

if ! bw login --check > /dev/null; then
  bw login "${BITWARDEN_EMAIL:-}"
elif [ -z "${BW_SESSION:-}" ]; then
  bw unlock
else
  echo "The BW_SESSION environment variable is already set."
fi
