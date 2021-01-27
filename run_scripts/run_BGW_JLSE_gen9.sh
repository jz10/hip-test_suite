#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime
module load hipcl

cd ../proxies/BerkeleyGW-Kernels-CPP/
git checkout origin/HIP

cd FF

clang++ -O3 -std=c++11   -c -o ff.o ff.cpp
clang++-link ff.o -o ff.ex   -lhipcl -lOpenCL

timing_check "./ff.ex" "$0"


cd ../GPP

clang++ -O3 -std=c++11   -c -o gpp.o gpp.cpp
clang++-link gpp.o -o gpp.ex   -lhipcl -lOpenCL


timing_check "./gpp.ex " "$0"
