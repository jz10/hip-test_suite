#!/bin/bash

module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/

cd strided-access
clang++ -std=c++11 -O3 -c benchmark-hip.cpp
clang++-link -std=c++11 -O3 -o strided-access benchmark-hip.o  -lOpenCL -lhipcl
./strided-access
