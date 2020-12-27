#! /usr/bin/env bash
set -euxo pipefail

rm -rf build
mkdir build
( cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF    \
    -DMICROHTTPD_ENABLE=OFF    \
    -DCUDA_ENABLE=OFF          \
    -DOpenCL_ENABLE=OFF        \
    -DCPU_ENABLE=ON            \
    -DOpenSSL_ENABLE=OFF       \
    -DHWLOC_ENABLE=OFF
)
cmake --build build
./build/bin/xmr-stak-rx                                                                              \
  -o stratum+tcp://gulf.moneroocean.stream:10001                                                     \
  -u 84FEn5Gak63AReZjRtDwV724TsoUtfajxjLHHJZ3zH3vcaAZJwvg4qWdUG9cx7nhA1ZfT9kK89roADmRb1ehLLhH6HyTATK \
  -p xmr-stak-rx
