#!/bin/bash
set -x
set -e
export PATH=`pwd`/depot_tools:$PATH
cd flutter
cp engine/scripts/standard.gclient .gclient
gclient sync -D

GN_ARGS=""
BUILDDIR=host_release
if [[ "$(uname)" == "Darwin" ]]; then
  GN_ARGS="--mac-cpu=arm64"
  BUILDDIR=host_release_arm64
fi
./engine/src/flutter/tools/gn $GN_ARGS --runtime-mode release
BUILDDIR=engine/src/out/$BUILDDIR
ninja -C $BUILDDIR sdk

find .|grep 'impeller_sdk.zip$'