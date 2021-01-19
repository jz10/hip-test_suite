#!/bin/bash

module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/

cd reduction
clang++ -std=c++11 -O3 -c reduction.cpp 
clang++-link -std=c++11 -O3 -o reduction reduction.o -lOpenCL -lhipcl
./run.sh
