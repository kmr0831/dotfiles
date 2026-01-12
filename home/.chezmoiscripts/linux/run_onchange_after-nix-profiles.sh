#!/bin/bash

set -eufo pipefail

nix run home-manager/master -- switch --flake "$CHEZMOI_SOURCE_DIR"#gin
