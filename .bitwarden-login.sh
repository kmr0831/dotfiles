#!/bin/bash

# シェルスクリプト内で export した環境変数は読めない: https://github.com/twpayne/chezmoi/issues/3729
# 代替案: https://github.com/twpayne/chezmoi/discussions/3202

set -eufo pipefail

if [ -n "$BW_SESSION" ]; then
  echo "The BW_SESSION environment variable is already set."
  exit 0
fi

if ! command -v bw &> /dev/null; then
  echo "bw is not installed" >&2
  exit 1
fi

if ! bw login --check > /dev/null; then
  bw login "${BITWARDEN_EMAIL:-}"
elif [ -z "${BW_SESSION:-}" ]; then
  bw unlock
fi
