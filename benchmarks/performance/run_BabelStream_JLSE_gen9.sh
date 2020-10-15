#!/bin/bash

module load hipcl

cd BabelStream


# HIPCL
clang++ -O3 -std=c++11 -DHIP main.cpp HIPStream.cpp  -lhipcl -lOpenCL -o hip-stream

# if what we should be measuring is the DRAM BW, then we should use 128MB as
# the cache (eDRAM). in that case, the calculation is:
# so for doubles, the size of the array is
# 128000 kiB * 1024 bytes/KiB * 1 double / 8 bytes * 4 (factor for STREAM)
# = 65536000
./hip-stream -s 65536000
