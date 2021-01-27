#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/

cd add4

clang++ -std=c++11 -O3 -c hip-stream.cpp -o hip-stream.o
clang++ -std=c++11 -O3   -c -o common.o common.cpp
clang++-link -std=c++11 -O3 common.o hip-stream.o -lm -o gpu-stream-hip -lOpenCL -lhipcl

timing_check "./gpu-stream-hip --groupSize 256" "$0"
