#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/BitonicSort/
clang++ --std c++14 -g -o BitonicSort BitonicSort.cpp -lhipcl -lOpenCL
./BitonicSort --quiet --verify
