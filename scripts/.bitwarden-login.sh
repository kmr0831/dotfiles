#!/bin/bash

# シェルスクリプト内で export した環境変数は読めない: https://github.com/twpayne/chezmoi/issues/3729
# 代替案: https://github.com/twpayne/chezmoi/discussions/3202

set -eufo pipefail

if ! command -v bw &> /dev/null; then
  echo "bw is not installed"
  exit 0
fi

BW_STATUS="$(bw status | jq '.status')"
case $BW_STATUS in
  "unauthenticated")
    echo "Not logged in, trying to log in..."
    export BW_SESSION="$(bw login "${BITWARDEN_EMAIL:-}" --raw)"
    ;;
  "locked")
    echo "Session is locked, unlocking..."
    export BW_SESSION="$(bw unlock --raw)"
    ;;
  *)
    # セッションが既に存在するか確認
    if [ -z "${BW_SESSION:-}" ]; then
      echo "Session undefined, unlocking..."
      export BW_SESSION="$(bw unlock --raw)"
    else
      echo "Session already unlocked"
    fi
    ;;
esac
