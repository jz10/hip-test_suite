#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime;
module load hipcl;
module load cmake;

cd ../HIP-Examples/GPU-STREAM
cmake .
clang++ --std c++14 -g -c -o main.o main.cpp -DIMPLEMENTATION_STRING=\"HIP\"
clang++ --std c++14 -g -c -o HIPStream.o HIPStream.cu
clang++-link -o HIPStream main.o HIPStream.o -lhipcl -lOpenCL
