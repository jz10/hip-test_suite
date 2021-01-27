#!/bin/bash

module load intel_compute_runtime
module load hipcl

cd BerkeleyGW-Kernels-CPP

git checkout origin/HIP
git reset --hard
git apply ../patches/BerkeleyGW-Kernels-CPP_patch

cd FF

echo " #### Running FF"
rm ./ff.ex ./ff.o

clang++ -O3 -std=c++11   -c -o ff.o ff.cpp
clang++-link ff.o -o ff.ex   -lhipcl -lOpenCL

./ff.ex


cd ../GPP

echo " #### Running GPP"
rm ./gpp.ex ./gpp.o

clang++ -O3 -std=c++11   -c -o gpp.o gpp.cpp
clang++-link gpp.o -o gpp.ex   -lhipcl -lOpenCL


./gpp.ex 

git reset --hard
