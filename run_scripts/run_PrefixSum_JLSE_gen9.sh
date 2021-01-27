#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/PrefixSum/
clang++ --std c++14 -g -o PrefixSum PrefixSum.cpp -lhipcl -lOpenCL
timing_check "./PrefixSum --quiet --verify" "$0"
