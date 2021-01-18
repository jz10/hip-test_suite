#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/MatrixMultiplication/
clang++ --std c++14 -g -o MatrixMultiplication MatrixMultiplication.cpp -lhipcl -lOpenCL
./MatrixMultiplication --quiet --verify
