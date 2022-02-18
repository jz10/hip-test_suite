#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/HIP-Examples-Applications/FastWalshTransform/
clang++ --std c++14 -g -o FastWalshTransform FastWalshTransform.cpp $CXXFLAGS
timing_check "./FastWalshTransform --quiet --verify" "$0"
