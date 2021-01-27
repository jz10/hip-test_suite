#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/
cd mini-nbody/hip

## orig
clang++  -std=c++11 -I../ -DSHMOO nbody-orig.cpp -o nbody-orig -lOpenCL -lhipcl

EXE=nbody-orig
K=1024
for i in {1..10}
do
    echo ./$EXE $K
    timing_check "./$EXE $K" "$0"
    K=$(($K*2))
done

## soa
clang++  -std=c++11 -I../ -DSHMOO nbody-soa.cpp -o nbody-soa -lOpenCL -lhipcl

EXE=nbody-soa
K=1024
for i in {1..8}
do
    echo ./$EXE $K
    timing_check "./$EXE $K" "$0"
    K=$(($K*2))
done

## block
clang++ -std=c++11 -I../ -DSHMOO nbody-block.cpp -o nbody-block -lOpenCL -lhipcl

EXE=nbody-block
K=1024
for i in {1..8}
do
    echo ./$EXE $K
    timing_check "./$EXE $K" "$0"
    K=$(($K*2))
done

