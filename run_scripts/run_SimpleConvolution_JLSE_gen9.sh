#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/SimpleConvolution/
clang++ --std c++14 -g -o SimpleConvolution SimpleConvolution.cpp -lhipcl -lOpenCL
./SimpleConvolution --quiet --verify
