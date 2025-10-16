#!/bin/bash
set -x
set -e
export PATH=`pwd`/depot_tools:$PATH
cd flutter
gclient sync -D

GN_ARGS=""
if [[ "$(uname)" == "Darwin" ]]; then
  GN_ARGS="--mac-cpu=arm64"
fi
./engine/src/flutter/tools/gn $GN_ARGS --runtime-mode release

ninja -C engine/src/out/host_release sdk