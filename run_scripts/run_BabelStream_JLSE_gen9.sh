#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../benchmarks/performance/BabelStream

rm -f ./hip-stream
# HIPCL
sed s/"#define TBSIZE 1024"/"#define TBSIZE 256"/ HIPStream.cpp > HIPStream_gen9.cpp
sed -i s/"#define DOT_NUM_BLOCKS 256"/"#define DOT_NUM_BLOCKS 32"/ HIPStream_gen9.cpp
clang++ -O3 -std=c++11 -DHIP main.cpp HIPStream_gen9.cpp  $CXXFLAGS -o hip-stream

# if what we should be measuring is the DRAM BW, then we should use 128MB as
# the cache (eDRAM). in that case, the calculation is:
# so for doubles, the size of the array is
# 128000 kiB * 1024 bytes/KiB * 1 double / 8 bytes * 4 (factor for STREAM)
# = 65536000
timing_check "./hip-stream -s 65536000" "$0"

rm -f hip-stream

git reset --hard
# opencl
#module purge
#
#make -f OpenCL.make clean
#make -f OpenCL.make
#./ocl-stream -s 65536000
