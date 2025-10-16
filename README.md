
# Producing CI builds

1) clone this repo (without submodules, flutter is huge)
2) Update submodule hash - `git update-index --add --cacheinfo 160000 cb94cc07057451941b0e1e6b75919fa0fae19c3a flutter`
3) `git commit -m "Update flutter to cb94cc07057451941b0e1e6b75919fa0fae19c3a"`
4) `git tag 2025-10-15`
5) `git push origin --tags`

# References

Flutter build documentation:

https://github.com/flutter/flutter/blob/cb94cc07057451941b0e1e6b75919fa0fae19c3a/docs/engine/contributing/Setting-up-the-Engine-development-environment.md#gclient-bootstrap
https://github.com/flutter/flutter/blob/cb94cc07057451941b0e1e6b75919fa0fae19c3a/docs/engine/contributing/Compiling-the-engine.md#compiling-for-macos-or-linux