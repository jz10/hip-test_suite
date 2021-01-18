#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/FloydWarshall/
clang++ --std c++14 -g -o FloydWarshall FloydWarshall.cpp -lhipcl -lOpenCL
./FloydWarshall --quiet --verify
