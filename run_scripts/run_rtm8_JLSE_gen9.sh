#!/bin/bash

module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/

cd rtm8
clang++ -std=c++11 -O3 -c rtm8.cpp
clang++-link -std=c++11 -O3 -o rtm8_hip rtm8.o -lOpenCL -lhipcl
./rtm8_hip
