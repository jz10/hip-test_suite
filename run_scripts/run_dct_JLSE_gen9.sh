#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/HIP-Examples-Applications/dct/
clang++ --std c++14 -g -o dct dct.cpp $CXXFLAGS
timing_check "./dct --quiet --verify" "$0"
