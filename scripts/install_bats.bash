#!/bin/bash

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPTS_DIR/.." && pwd)"

abort() {
  >&2 printf "$*" && exit 1
}

cd "$ROOT_DIR"

command -v curl &>/dev/null || abort "curl command required"

BATS_TAR_PATH="$ROOT_DIR/v0.4.0.tar.gz"

curl -sL -o "$BATS_TAR_PATH" 'https://github.com/sstephenson/bats/archive/v0.4.0.tar.gz'
tar -xzf "$BATS_TAR_PATH"
rm "$BATS_TAR_PATH" 
