#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/

cd strided-access
clang++ -std=c++11 -O3 -c benchmark-hip.cpp
clang++-link -std=c++11 -O3 -o strided-access benchmark-hip.o  -lOpenCL -lhipcl
timing_check "./strided-access" "$0"
