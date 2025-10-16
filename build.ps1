$ErrorActionPreference = "Stop"
$env:PATH = "$(Get-Location)\depot_tools;$env:PATH"
Set-Location flutter
Copy-Item engine\scripts\standard.gclient .gclient -Force
gclient sync -D

$GN_ARGS = ""
$BUILDDIR = "host_release"

engine\src\flutter\tools\gn.bat $GN_ARGS --runtime-mode release
$BUILDDIR = "engine\src\out\$BUILDDIR"
ninja -C $BUILDDIR sdk

Get-ChildItem -Recurse -Filter impeller_sdk.zip

