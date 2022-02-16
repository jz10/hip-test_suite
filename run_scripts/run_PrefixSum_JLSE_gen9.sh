#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/HIP-Examples-Applications/PrefixSum/
clang++ --std c++14 -g -o PrefixSum PrefixSum.cpp $CXXFLAGS
timing_check "./PrefixSum --quiet --verify" "$0"
