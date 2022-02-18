#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/HIP-Examples-Applications/BinomialOption/
clang++ --std=c++14 -g -o BinomialOption BinomialOption.cpp $CXXFLAGS
timing_check "./BinomialOption --quiet --verify" "$0"
