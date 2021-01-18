#!/bin/bash

module load intel_compute_runtime;
module load hipcl;

cd ../HIP-Examples/HIP-Examples-Applications/BinomialOption/
clang++ --std c++14 -g -o BinomialOption BinomialOption.cpp -lhipcl -lOpenCL
./BinomialOption --quiet --verify
