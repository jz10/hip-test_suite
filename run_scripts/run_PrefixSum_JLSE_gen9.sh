#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/PrefixSum/
clang++ --std c++14 -g -o PrefixSum PrefixSum.cpp -lhipcl -lOpenCL
./PrefixSum --quiet --verify
