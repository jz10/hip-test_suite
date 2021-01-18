#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/HelloWorld/
clang++ --std c++14 -g -o HelloWorld HelloWorld.cpp -lhipcl -lOpenCL
./HelloWorld --quiet --verify
