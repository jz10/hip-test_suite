#!/bin/bash

module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/

cd rodinia_3.0/hip
make clean -j 4

# fix some things 
sed -i s/"#define THREADS_PER_BLOCK 512"/"#define THREADS_PER_BLOCK 256"/ streamcluster/streamcluster_hip.cu
sed -i s/"#define NUMBER_THREADS 512"/"#define NUMBER_THREADS 256"/ srad/srad_v1/define.c
sed -i s/"#define NUMBER_THREADS 512"/"#define NUMBER_THREADS 256"/ srad/cusrc/srad_v1/define.c
sed -i s/"#define MAXBLOCKSIZE 512"/"#define MAXBLOCKSIZE 256"/ gaussian/gaussian.cu
sed -i s/"#include \"common.h\""/"#include \"common.h\"\n#include <string.h>"/ dwt2d/dwt.cu


make test HIPCC="clang++ -std=c++11" HIPLD="clang++-link -std=c++11 -lOpenCL -lhipcl"

sed -i s/"#define THREADS_PER_BLOCK 256"/"#define THREADS_PER_BLOCK 512"/ streamcluster/streamcluster_hip.cu
sed -i s/"#define NUMBER_THREADS 256"/"#define NUMBER_THREADS 512"/ srad/srad_v1/define.c
sed -i s/"#define NUMBER_THREADS 256"/"#define NUMBER_THREADS 512"/ srad/cusrc/srad_v1/define.c
sed -i s/"#define MAXBLOCKSIZE 256"/"#define MAXBLOCKSIZE 512"/ gaussian/gaussian.cu
sed -i s/"\n#include <string.h>"// dwt2d/dwt.cu
