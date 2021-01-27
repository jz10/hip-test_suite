#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/dct/
clang++ --std c++14 -g -o dct dct.cpp -lhipcl -lOpenCL
timing_check "./dct --quiet --verify" "$0"
