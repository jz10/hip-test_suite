#!/bin/bash

# get the definition of timing_check
source timing_check.sh

module load intel_compute_runtime
module load hipcl

cd ../proxies/adept-proxy/adept-hip

git reset --hard

git apply ../../../run_scripts/patches/adept-hip_patch

make

make clean

git reset --hard
