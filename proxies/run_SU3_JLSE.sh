#!/bin/bash

module load hip
module load gcc/7.4.0
export CUDA_PATH=/soft/compilers/cuda/cuda-10.0.130

cd su3_bench

# HIP
#hipcc -DMILC_COMPLEX --std c++14  -DUSE_HIP -DPRECISION=1 -o bench_f32_hip.exe su3_nn_bench.cpp 
hipcc --std c++14 -gencode=arch=compute_70,code=sm_70 -DUSE_CUDA  -DUSE_HIP -DPRECISION=1 -o bench_f32_hip.exe su3_nn_bench.cpp 
# not using Makefile.hip since nvcc (under HIP) doens't like `-Wno-deprecated-register`
./bench_f32_hip.exe -i 1000

# CUDA
make -f Makefile.cuda
./bench_f32_cuda.exe -i 1000

