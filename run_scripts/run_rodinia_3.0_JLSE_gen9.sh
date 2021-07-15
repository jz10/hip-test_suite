#!/bin/bash

# get the definition of timing_check
#source timing_check.sh

function timing_check() {
    { time $1 ; } 2> out
    cat out
    runtime=$(grep 'real' out | grep "s$" | awk '{print $2}')
    echo "runtime for \"$1\" is" $runtime
    rm out
}


module load intel_compute_runtime
module load hipcl

cd ../HIP-Examples/rodinia_3.0/hip

git reset --hardi
# fix some things 
git apply ../../../run_scripts/patches/rodinia_patch 

make clean
export HIPCC=clang++
export HIPCC_FLAGS=-std=c++11
export OMPCC=gcc
export HIPLD="clang++-link -std=c++11 -lOpenCL -lhipcl"
timing_check 'make test' "$0"

git reset --hard
