#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/MatrixMultiplication/
clang++ --std c++14 -g -o MatrixMultiplication MatrixMultiplication.cpp -lhipcl -lOpenCL
timing_check "./MatrixMultiplication --quiet --verify" "$0"
