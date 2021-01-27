#!/bin/bash

module load intel_compute_runtime
module load hipcl
module load cmake

cd kokkos

git reset --hard
git apply  ../patches/kokkos_patch

rm -rf build
mkdir build
cd build


#CXX=/home/bertoni/clang_wrap++ CXXFLAGS="-std=c++11" cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/home/bertoni/tmp/ -DKokkos_ENABLE_HIP=ON -DKokkos_ARCH_GEN9_HIPCL=ON -DCMAKE_CXX_EXTENSIONS=OFF

CXX=/home/bertoni/clang_wrap++ CXXFLAGS="-std=c++11" cmake .. -DCMAKE_INSTALL_PREFIX=/home/bertoni/tmp/ -DKokkos_ENABLE_HIP=ON -DKokkos_ARCH_GEN9_HIPCL=ON -DCMAKE_CXX_EXTENSIONS=OFF

make

git reset --hard
