#!/usr/bin/env bash
#
# A dynamic scala runner.
# Author: Dale Wijnand <dale.wijnand@gmail.com>
# https://github.com/dwijnand/scala-runner

set -o pipefail

die() { echo "Aborting: $*"; exit 1; }

COURSIER=coursier
if ! command -v $COURSIER > /dev/null 2>&1; then
  COURSIER="$HOME/.coursier/coursier"
  if ! command -v $COURSIER > /dev/null 2>&1; then
    mkdir -p $(dirname "$COURSIER") || die "Failed to create $(dirname "$COURSIER")"
    curl -Lo "$COURSIER" https://git.io/coursier-cli || die "Failed to download coursier"
    chmod +x "$COURSIER" || die "Failed to make coursier executable"
  fi
fi

"$COURSIER" launch org.scala-lang:scala-compiler:2.13.0 \
  --main-class scala.tools.nsc.MainGenericRunner \
  -D scala.usejavacp=true \
  -- "$@"
