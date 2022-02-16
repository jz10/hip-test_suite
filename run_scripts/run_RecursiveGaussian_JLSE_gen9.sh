#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/HIP-Examples-Applications/RecursiveGaussian/
clang++ --std c++14 -g -o RecursiveGaussian RecursiveGaussian.cpp $CXXFLAGS
timing_check "./RecursiveGaussian --quiet --verify" "$0"
