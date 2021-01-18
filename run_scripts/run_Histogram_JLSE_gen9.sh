#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/Histogram/
clang++ --std c++14 -g -o Histogram Histogram.cpp -lhipcl -lOpenCL
./Histogram --quiet --verify
