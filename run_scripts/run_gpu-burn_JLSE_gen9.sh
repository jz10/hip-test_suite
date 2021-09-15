#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/

cd gpu-burn
git reset --hard
sed -i s/"#define GPUBURN_COMMON_H_"/"#define GPUBURN_COMMON_H_\n#include <memory>\n#include <string>"/ common.h
clang++ -O3 -std=c++11 -c -o gpuburn.o gpuburn.cpp  
clang++ -O3 -std=c++11 -c -o common.o common.cpp  
clang++ -O3 -std=c++11 -c -o BurnKernel.o BurnKernel.cpp  
clang++ -O3 -std=c++11 -c -o AmdGpuMonitor.o AmdGpuMonitor.cpp  
clang++-link -lm -lpthread -o gpuburn-hip gpuburn.o common.o BurnKernel.o AmdGpuMonitor.o   -lOpenCL -lhipcl
# reverting
timing_check "./gpuburn-hip -t 5" "$0"

git reset --hard
