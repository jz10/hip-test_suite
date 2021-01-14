#!/bin/bash

module load intel_compute_runtime
module load hipcl
git checkout origin/HIP

cd FF

clang++ -O3 -std=c++11   -c -o ff.o ff.cpp
clang++-link ff.o -o ff.ex   -lhipcl -lOpenCL

./ff.ex


cd ../GPP

clang++ -O3 -std=c++11   -c -o gpp.o gpp.cpp
clang++-link gpp.o -o gpp.ex   -lhipcl -lOpenCL


./gpp.ex 
