#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/RecursiveGaussian/
clang++ --std c++14 -g -o RecursiveGaussian RecursiveGaussian.cpp -lhipcl -lOpenCL
./RecursiveGaussian --quiet --verify
