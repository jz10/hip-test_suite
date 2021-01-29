#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/FloydWarshall/
clang++ --std c++14 -g -o FloydWarshall FloydWarshall.cpp -lhipcl -lOpenCL
timing_check "./FloydWarshall --quiet --verify" "$0"
