#!/bin/bash

module load hip
export CUDA_PATH=/soft/compilers/cuda/cuda-10.0.130

cd BablelStream

make -f HIP.make clean
make -f HIP.make

./hip-stream
