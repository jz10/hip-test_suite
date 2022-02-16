#!/bin/bash

# get the definition of timing_check
source timing_check.sh
cd ../HIP-Examples/rodinia_3.0/hip

git reset --hard
# fix some things 
git apply ../../../run_scripts/patches/rodinia_patch 

make clean
export HIPCC=clang++
export HIPCC_FLAGS=-std=c++11
export OMPCC=gcc
export HIPLD="clang++-link -std=c++11 $CXXFLAGS"
make test HIPCC=clang++ HIPCC_FLAGS="-std=c++11 -I ../../common/" OMPCC=gcc HIPLD="clang++-link -std=c++11 $CXXFLAGS"

git reset --hard
