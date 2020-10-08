#!/bin/bash

module load hip
export CUDA_PATH=/soft/compilers/cuda/cuda-10.0.130

cd BabelStream


# HIP
make -f HIP.make clean
make -f HIP.make

# 4* 6 MB cache / 8 btes per douuble = this input
./hip-stream -s 3145728


# CUDA
make -f CUDA.make clean
make -f CUDA.make

# 4* 6 MB cache / 8 btes per douuble = this input
./cuda-stream -s 3145728
