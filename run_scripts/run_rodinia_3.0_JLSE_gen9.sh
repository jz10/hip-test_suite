#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/rodinia_3.0/hip

git reset --hard
# fix some things 
git apply ../../../run_scripts/patches/rodinia_patch 

make clean

timing_check 'make test HIPCC="clang++ -std=c++11" OMPCC=gcc HIPLD="clang++-link -std=c++11 -lOpenCL -lhipcl"' "$0"

git reset --hard
