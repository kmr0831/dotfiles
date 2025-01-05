#!/bin/bash

set -eufo pipefail

install_homebrew() {
  command -v brew >/dev/null 2>&1 && return

  echo "Homebrew is not installed. Installing Homebrew"

  case "$(uname -s)" in
  Darwin)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # eval "$(/opt/homebrew/bin/brew shellenv)"
    brew install bitwarden-cli
    ;;
  Linux*)
    sudo apt-get update && \
      sudo apt-get upgrade && \
      sudo apt-get install -y build-essential procps curl file git && \
      sudo apt-get autoremove && \
      sudo apt-get autoclean

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    brew install bitwarden-cli
    ;;
  *)
    echo "unsupported OS"
    exit 1
    ;;
  esac
}

main() {
  command -v bw >/dev/null 2>&1 && exit
  install_homebrew
}

main
