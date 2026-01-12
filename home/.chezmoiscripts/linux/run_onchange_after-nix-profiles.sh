#!/bin/bash

set -eufo pipefail

nix run home-manager/master -- switch --flake .#gin
