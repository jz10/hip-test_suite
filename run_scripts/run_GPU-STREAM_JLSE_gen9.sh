#!/bin/bash

# get the definition of timing_check
source timing_check.sh



module load cmake

cd ../HIP-Examples/GPU-STREAM
cmake .
clang++ -std=c++14 -g -c -o main.o main.cpp -DIMPLEMENTATION_STRING=\"HIP\" -DHIP
clang++ -std=c++14 -g -c -o HIPStream.o HIPStream.cu
clang++-link -o HIPStream main.o HIPStream.o $CXXFLAGS
./HIPStream -s 65536000
