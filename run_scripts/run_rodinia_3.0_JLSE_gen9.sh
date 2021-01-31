#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/

cd rodinia_3.0/hip
make clean -j 4

git reset --hard
# fix some things 
sed -i s/"#define THREADS_PER_BLOCK 512"/"#define THREADS_PER_BLOCK 256"/ streamcluster/streamcluster_hip.cu
sed -i s/"#define NUMBER_THREADS 512"/"#define NUMBER_THREADS 256"/ srad/srad_v1/define.c
sed -i s/"#define NUMBER_THREADS 512"/"#define NUMBER_THREADS 256"/ srad/cusrc/srad_v1/define.c
sed -i s/"#define MAXBLOCKSIZE 512"/"#define MAXBLOCKSIZE 256"/ gaussian/gaussian.cu
sed -i s/"#include \"common.h\""/"#include \"common.h\"\n#include <string.h>"/ dwt2d/dwt.cu
sed -s s/"./b+"/"timeout -k 9 60 ./b+"/ ../test/b+tree/run0.cmd

timing_check 'make test HIPCC="clang++ -std=c++11" OMPCC=gcc HIPLD="clang++-link -std=c++11 -lOpenCL -lhipcl"' "$0"

git reset --hard
