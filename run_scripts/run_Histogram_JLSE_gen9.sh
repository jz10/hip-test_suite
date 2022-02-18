#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/HIP-Examples-Applications/Histogram/
clang++ --std c++14 -g -o Histogram Histogram.cpp $CXXFLAGS
timing_check "./Histogram --quiet --verify" "$0"
