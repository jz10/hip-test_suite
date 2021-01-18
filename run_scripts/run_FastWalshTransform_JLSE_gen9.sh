#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/FastWalshTransform/
clang++ --std c++14 -g -o FastWalshTransform FastWalshTransform.cpp -lhipcl -lOpenCL
./FastWalshTransform --quiet --verify
