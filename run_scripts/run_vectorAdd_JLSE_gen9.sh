#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/

cd vectorAdd
clang++ -g -std=c++11 -c -o vectoradd_hip.o vectoradd_hip.cpp
clang++-link vectoradd_hip.o -o vectoradd_hip.exe  -lOpenCL -lhipcl
timing_check "./vectoradd_hip.exe" "$0"
