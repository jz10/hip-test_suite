#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/HIP-Examples-Applications/MatrixMultiplication/
clang++ --std c++14 -g -o MatrixMultiplication MatrixMultiplication.cpp $CXXFLAGS
timing_check "./MatrixMultiplication --quiet --verify" "$0"
