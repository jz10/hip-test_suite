#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/BitonicSort/
clang++ --std c++14 -g -o BitonicSort BitonicSort.cpp -lhipcl -lOpenCL
timing_check "./BitonicSort --quiet --verify" "$0"
