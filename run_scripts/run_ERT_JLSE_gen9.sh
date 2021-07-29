#!/bin/bash

# get the definition of timing_check
source timing_check.sh




cp ../benchmarks/performance/ERT_configs/config.*-fp*.iris.jlse.anl.gov.01 ../benchmarks/performance/cs-roofline-toolkit/Empirical_Roofline_Tool-1.1.0/Config
cd ../benchmarks/performance/cs-roofline-toolkit/Empirical_Roofline_Tool-1.1.0

# HIP
timing_check "python ./ert --verbose=3 Config/config.hip-fp64.iris.jlse.anl.gov.01" "$0"
timing_check "python ./ert --verbose=3 Config/config.hip-fp32.iris.jlse.anl.gov.01"  "$0"

grep -A 1 "GFLOPs" Results.hip.iris.fp64.01/Run.001/roofline.json
grep -A 1 "DRAM" Results.hip.iris.fp64.01/Run.001/roofline.json
grep -A 1 "GFLOPs" Results.hip.iris.fp32.01/Run.001/roofline.json
grep -A 1 "DRAM" Results.hip.iris.fp32.01/Run.001/roofline.json

# OCL
#module purge
#


#python ./ert --verbose=3 Config/config.ocl-fp64.iris.jlse.anl.gov.01 
#python ./ert --verbose=3 Config/config.ocl-fp32.iris.jlse.anl.gov.01 




