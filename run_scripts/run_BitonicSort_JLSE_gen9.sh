#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/HIP-Examples-Applications/BitonicSort/
clang++ --std c++14 -g -o BitonicSort BitonicSort.cpp $CXXFLAGS
timing_check "./BitonicSort --quiet --verify" "$0"
