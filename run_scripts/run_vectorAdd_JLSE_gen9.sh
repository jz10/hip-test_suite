#!/bin/bash

module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/

cd vectorAdd
clang++ -g -std=c++11 -c -o vectoradd_hip.o vectoradd_hip.cpp
clang++-link vectoradd_hip.o -o vectoradd_hip.exe  -lOpenCL -lhipcl
./vectoradd_hip.exe
