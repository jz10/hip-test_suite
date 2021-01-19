#!/bin/bash

module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/

cd cuda-stream
clang++ -std=c++11 -O3 -o stream stream.cpp -lOpenCL -lhipcl
./stream
