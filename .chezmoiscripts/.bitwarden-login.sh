#!/bin/bash

set -eufo pipefail

if ! command -v bw &> /dev/null; then
  echo "bw is not installed"
  exit 0
fi

BW_STATUS="$(bw status | jq '.status')"
if [ $BW_STATUS = "unauthenticated" ]; then
  echo "Not logged in, try login"
  export BW_SESSION="$(bw login "${BITWARDEN_EMAIL:-}" --raw)"
elif [ $BW_STATUS -eq "locked" ]; then
  echo "Not active session, try unlock"
  export BW_SESSION="$(bw unlock --raw)"
else
  echo "Already unlocked"
fi
