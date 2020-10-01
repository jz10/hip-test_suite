#!/bin/bash

module load hip
module load gcc/7.4.0
export CUDA_PATH=/soft/compilers/cuda/cuda-10.0.130

cd cs-roofline-toolkit/Empirical_Roofline_Tool-1.1.0

# HIP
python2 ./ert --verbose=3 Config/config.hip-fp64.v100.jlse.anl.gov.01 
python2 ./ert --verbose=3 Config/config.hip-fp32.v100.jlse.anl.gov.01 


# CUDA
python2 ./ert --verbose=3 Config/config.cuda-fp64.v100.jlse.anl.gov.01
python2 ./ert --verbose=3 Config/config.cuda-fp32.v100.jlse.anl.gov.01



