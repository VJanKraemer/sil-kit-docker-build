#! /usr/bin/env sh

CMAKE_PRESET="gcc${1}-relwithdebinfo"

echo "Building ${CMAKE_PRESET}"

git -c http.sslverify=false clone --recursive --shallow-submodules --depth=1 https://github.com/vectorgrp/sil-kit.git

cd sil-kit

cmake --preset $CMAKE_PRESET
cmake --build --preset $CMAKE_PRESET
ctest --preset $CMAKE_PRESET
