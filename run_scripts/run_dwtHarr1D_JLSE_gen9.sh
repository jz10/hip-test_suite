#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/dwtHaar1D/
clang++ --std c++14 -g -o dwtHaar1D dwtHaar1D.cpp -lhipcl -lOpenCL
./dwtHaar1D --quiet --verify
