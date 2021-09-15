#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/

cd reduction
clang++ -std=c++11 -O3 -c reduction.cpp 
clang++-link -std=c++11 -O3 -o reduction reduction.o -lOpenCL -lhipcl
timing_check "./run.sh" "$0"
