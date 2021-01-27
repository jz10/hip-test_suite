#!/bin/bash

module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/
cd mini-nbody/hip

git reset --hard
git apply ../../../run_scripts/patches/mini-nbody_patch

## orig
clang++  -std=c++11 -I../ -DSHMOO nbody-orig.cpp -o nbody-orig -lOpenCL -lhipcl

EXE=nbody-orig
K=1024
for i in {1..6}
do
    echo ./$EXE $K
    ./$EXE $K
    K=$(($K*2))
done

## soa
clang++  -std=c++11 -I../ -DSHMOO nbody-soa.cpp -o nbody-soa -lOpenCL -lhipcl

EXE=nbody-soa
K=1024
for i in {1..6}
do
    echo ./$EXE $K
    ./$EXE $K
    K=$(($K*2))
done

## block
clang++ -std=c++11 -I../ -DSHMOO nbody-block.cpp -o nbody-block -lOpenCL -lhipcl

EXE=nbody-block
K=1024
for i in {1..6}
do
    echo ./$EXE $K
    ./$EXE $K
    K=$(($K*2))
done

#git reset --hard
rm nbody-block nbody-soa nbody-orig
