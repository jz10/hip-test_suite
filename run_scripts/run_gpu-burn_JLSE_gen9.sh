#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/

cd gpu-burn
sed -i s/"#define GPUBURN_COMMON_H_"/"#define GPUBURN_COMMON_H_\n#include <memory>"/ common.h
clang++ -O3 -std=c++11 -c -o gpuburn.o gpuburn.cpp  
clang++ -O3 -std=c++11 -c -o common.o common.cpp  
clang++ -O3 -std=c++11 -c -o BurnKernel.o BurnKernel.cpp  
clang++ -O3 -std=c++11 -c -o AmdGpuMonitor.o AmdGpuMonitor.cpp  
clang++-link -lm -lpthread -o gpuburn-hip gpuburn.o common.o BurnKernel.o AmdGpuMonitor.o   -lOpenCL -lhipcl
# reverting
sed -i s/"#include <memory>"/""/ common.h
timing_check "./gpuburn-hip -t 5" "$0"
