#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/mixbench
ln -fs $HIPCL_DIR/include/hip/hip_runtime.h hip_runtime_api.h
clang++ --std c++14 -I $HIPCL_DIR/include/hip -I ./ -g -c -o main-hip.o main-hip.cpp
clang++ --std c++14 -I $HIPCL_DIR/include/hip -I ./ -g -c -o mix_kernels_hip.o mix_kernels_hip.cpp
clang++ --std c++14 -I $HIPCL_DIR/include/hip -I ./ -g -c -o main-hip-ro.o main-hip-ro.cpp
clang++ --std c++14 -I $HIPCL_DIR/include/hip -I ./ -g -c -o mix_kernels_hip-ro.o mix_kernels_hip_ro.cpp
clang++-link -o mixbench-hip main-hip.o mix_kernels_hip.o -lhipcl -lOpenCL
clang++-link -o mixbench-hip-ro main-hip-ro.o mix_kernels_hip-ro.o -lhipcl -lOpenCL
./mixbench-hip
./mixbench-hip-ro
unlink hip_runtime_api.h
