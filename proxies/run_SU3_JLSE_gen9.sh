#!/bin/bash

module load hipcl

cd su3_bench

# HIP
#hipcc -DMILC_COMPLEX --std c++14  -DUSE_HIP -DPRECISION=1 -o bench_f32_hip.exe su3_nn_bench.cpp 
clang++ -DMILC_COMPLEX --std c++14  -DUSE_HIP -DPRECISION=1 -o bench_f32_hip.exe su3_nn_bench.cpp -lhipcl -lOpenCL
# not using Makefile.hip since nvcc (under HIP) doens't like `-Wno-deprecated-register`
./bench_f32_hip.exe -i 1000


