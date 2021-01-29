#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/HelloWorld/
clang++ --std c++14 -g -o HelloWorld HelloWorld.cpp -lhipcl -lOpenCL
timing_check "./HelloWorld --quiet --verify" "$0"
