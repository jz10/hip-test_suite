#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/

cd cuda-stream
clang++ -std=c++11 -O3 -o stream stream.cpp -lOpenCL -lhipcl
timing_check "./stream -n 134217728" "$0"
