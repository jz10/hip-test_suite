#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime
module load hipcl
module load cmake

cd ../frameworks/RAJA

cd blt
git reset --hard
git apply ../../patches/blt_patch
cd ..

rm -rf build
mkdir build
cd build

# error on cmake
CC=clang CXX=/home/bertoni/clang_wrap++ cmake -DENABLE_OPENMP=Off -DENABLE_HIP=On ../.

make

cd ..

rm -rf build
mkdir build
cd build

# error on HIPMallocManaged
CC=clang CXX=/home/bertoni/clang_wrap++ cmake -DENABLE_OPENMP=Off ../.

make

git reset --hard
