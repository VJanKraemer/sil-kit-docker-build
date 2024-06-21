#! /usr/bin/env sh


git -c http.sslverify=false clone --recursive --shallow-submodules --depth=1 https://github.com/vectorgrp/sil-kit.git

cd sil-kit

cmake --preset gcc8-relwithdebinfo
cmake --build --preset gcc8-relwithdebinfo
ctest --preset gcc8-relwithdebinfo
