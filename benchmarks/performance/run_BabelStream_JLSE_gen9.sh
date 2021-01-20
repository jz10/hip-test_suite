#!/bin/bash

#module load hipcl/9.0

module load intel_compute_runtime
#module load pocl
module load hipcl

cd BabelStream

rm ./hip-stream
# HIPCL
sed s/"#define TBSIZE 1024"/"#define TBSIZE 256"/ HIPStream.cpp > HIPStream_gen9.cpp
sed -i s/"#define DOT_NUM_BLOCKS 256"/"#define DOT_NUM_BLOCKS 32"/ HIPStream_gen9.cpp
clang++ -O3 -std=c++11 -DHIP main.cpp HIPStream_gen9.cpp  -lhipcl -lOpenCL -o hip-stream

# if what we should be measuring is the DRAM BW, then we should use 128MB as
# the cache (eDRAM). in that case, the calculation is:
# so for doubles, the size of the array is
# 128000 kiB * 1024 bytes/KiB * 1 double / 8 bytes * 4 (factor for STREAM)
# = 65536000
./hip-stream -s 65536000

# opencl
#module purge
#module load intel_compute_runtime
#make -f OpenCL.make clean
#make -f OpenCL.make
#./ocl-stream -s 65536000
