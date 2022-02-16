#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/

cd rtm8
clang++ -std=c++11 -O3 -c rtm8.cpp
clang++-link -std=c++11 -O3 -o rtm8_hip rtm8.o $CXXFLAGS
timing_check "./rtm8_hip" "$0"
