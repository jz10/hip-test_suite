#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/
cd mini-nbody/hip

git reset --hard
git apply ../../../run_scripts/patches/mini-nbody_patch

## orig
clang++  -std=c++11 -I../ -DSHMOO nbody-orig.cpp -o nbody-orig $CXXFLAGS

EXE=nbody-orig
K=1024
for i in {1..6}
do
    echo ./$EXE $K
    timing_check "./$EXE $K" "$0"
    K=$(($K*2))
done

## soa
clang++  -std=c++11 -I../ -DSHMOO nbody-soa.cpp -o nbody-soa $CXXFLAGS

EXE=nbody-soa
K=1024
for i in {1..6}
do
    echo ./$EXE $K
    timing_check "./$EXE $K" "$0"
    K=$(($K*2))
done

## block
clang++ -std=c++11 -I../ -DSHMOO nbody-block.cpp -o nbody-block $CXXFLAGS

EXE=nbody-block
K=1024
for i in {1..6}
do
    echo ./$EXE $K
    timing_check "./$EXE $K" "$0"
    K=$(($K*2))
done

#git reset --hard
rm nbody-block nbody-soa nbody-orig
