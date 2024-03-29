#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../proxies/BerkeleyGW-Kernels-CPP/

git checkout origin/HIP
git reset --hard
git apply ../patches/BerkeleyGW-Kernels-CPP_patch

cd FF

echo " #### Running FF"
rm -f ./ff.ex ./ff.o

clang++ -O3 -std=c++11   -c -o ff.o ff.cpp
clang++-link ff.o -o ff.ex   $CXXFLAGS

timing_check "./ff.ex" "$0"
rm -f ./ff.ex ./ff.o

cd ../GPP

echo " #### Running GPP"
rm -f ./gpp.ex ./gpp.o

clang++ -O3 -std=c++11   -c -o gpp.o gpp.cpp
clang++-link gpp.o -o gpp.ex   $CXXFLAGS


timing_check "./gpp.ex " "$0"
rm -f ./gpp.ex ./gpp.o

cd ..

git reset --hard
