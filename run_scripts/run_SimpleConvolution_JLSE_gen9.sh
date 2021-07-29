#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/HIP-Examples-Applications/SimpleConvolution/
clang++ --std c++14 -g -o SimpleConvolution SimpleConvolution.cpp -lhipcl -lOpenCL
timing_check "./SimpleConvolution --quiet --verify" "$0"
