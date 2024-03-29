#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/HIP-Examples-Applications/FloydWarshall/
clang++ --std c++14 -g -o FloydWarshall FloydWarshall.cpp $CXXFLAGS
timing_check "./FloydWarshall --quiet --verify" "$0"
