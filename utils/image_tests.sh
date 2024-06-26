#! /usr/bin/env sh

set -e
CMAKE_PRESET="clang-relwithdebinfo"

echo "Building ${CMAKE_PRESET}"

CLANG_LOCATION=$(which clang-18)
CLANGPLUS_LOCATION=$(which clang++-18)
echo "Using: \n${CLANG_LOCATION} \n${CLANGPLUS_LOCATION}"

git -c http.sslverify=false clone --recursive --shallow-submodules --depth=1 https://github.com/vectorgrp/sil-kit.git

cd sil-kit

cmake -DCMAKE_C_COMPILER=${CLANG_LOCATION} -DCMAKE_CXX_COMPILER=${CLANGPLUS_LOCATION} --preset $CMAKE_PRESET
cmake --build --preset $CMAKE_PRESET
ctest --preset $CMAKE_PRESET
