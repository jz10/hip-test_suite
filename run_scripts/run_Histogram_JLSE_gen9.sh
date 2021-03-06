#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/Histogram/
clang++ --std c++14 -g -o Histogram Histogram.cpp -lhipcl -lOpenCL
timing_check "./Histogram --quiet --verify" "$0"
