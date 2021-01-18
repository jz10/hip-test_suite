#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/dct/
clang++ --std c++14 -g -o dct dct.cpp -lhipcl -lOpenCL
./dct --quiet --verify
