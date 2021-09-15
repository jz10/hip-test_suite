#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cd ../HIP-Examples/HIP-Examples-Applications/dwtHaar1D/
clang++ --std c++14 -g -o dwtHaar1D dwtHaar1D.cpp -lhipcl -lOpenCL
timing_check "./dwtHaar1D --quiet --verify" "$0"
