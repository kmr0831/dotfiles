#!/bin/bash

set -eufo pipefail

has_bw() {
  command -v bw >/dev/null 2>&1
}

has_brew() {
  command -v brew >/dev/null 2>&1
}

install_bitwarden() {
  echo "bw is not installed. Installing Bitwarden CLI"

  has_brew || install_homebrew
  brew install bitwarden-cli
}

login_bitwarden() {
  bw login --check > /dev/null || bw login "${BITWARDEN_EMAIL:-}"
  # if ! bw login --check > /dev/null; then
  #   bw login "${BITWARDEN_EMAIL:-}"
  # elif [ -z "${BW_SESSION:-}" ]; then
  #   bw unlock
  # fi
}

install_homebrew() {
  echo "Homebrew is not installed. Installing Homebrew"

  case "$(uname -s)" in
  Darwin)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    ;;
  Linux*)
    sudo apt-get update && \
      sudo apt-get upgrade && \
      sudo apt-get install -y build-essential procps curl file git && \
      sudo apt-get autoremove && \
      sudo apt-get autoclean

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    ;;
  *)
    echo "unsupported OS"
    exit 1
    ;;
  esac
}

main() {
  if [ -n "${BW_SESSION:-}" ]; then
    echo "The BW_SESSION environment variable is already set."
    exit 0
  fi

  if has_bw; then
    login_bitwarden
  else
    install_bitwarden
    login_bitwarden
  fi
}

main
