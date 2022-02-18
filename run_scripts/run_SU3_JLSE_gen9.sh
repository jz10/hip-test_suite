#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../proxies/su3_bench

# HIP
#hipcc -DMILC_COMPLEX --std c++14  -DUSE_HIP -DPRECISION=1 -o bench_f32_hip.exe su3_nn_bench.cpp 
clang++ -DMILC_COMPLEX --std c++14  -DUSE_HIP -DPRECISION=1 -o bench_f32_hip.exe su3_nn_bench.cpp $CXXFLAGS
# not using Makefile.hip since nvcc (under HIP) doens't like `-Wno-deprecated-register`
timing_check "./bench_f32_hip.exe -i 1000" "$0"


