#!/bin/bash

# get the definition of timing_check
source timing_check.sh



module load cmake

cd ../frameworks/occa

git reset --hard
git checkout origin/hiplz-testing

./build_occa.sh 

CXX=/home/bertoni/clang_wrap++ CXXFLAGS="-std=c++11" cmake .. -DCMAKE_INSTALL_PREFIX=/home/bertoni/tmp/ -DKokkos_ENABLE_HIP=ON -DKokkos_ARCH_GEN9_HIPCL=ON -DCMAKE_CXX_EXTENSIONS=OFF  -DKokkos_ENABLE_TESTS=On

make

timing_check "make test" "$0"

git reset --hard
