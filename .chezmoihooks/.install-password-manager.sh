#!/bin/bash

set -eufo pipefail

if command -v bw &> /dev/null; then
  echo "bw is already installed"
else
  case "$(uname -s)" in
  Darwin)
    if ! command -v brew &> /dev/null; then
      echo "Homebrew is not installed. Installing Homebrew (pre hook)"
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
    # eval "$(/opt/homebrew/bin/brew shellenv)"
    brew install bitwarden-cli
    ;;
  Linux*)
    ;;
  *)
    echo "unsupported OS"
    exit 1
    ;;
  esac
fi
