#!/bin/bash

module load intel_compute_runtime
module load hipcl

cp ERT_configs/config.*-fp*.iris.jlse.anl.gov.01 cs-roofline-toolkit/Empirical_Roofline_Tool-1.1.0/Config
cd cs-roofline-toolkit/Empirical_Roofline_Tool-1.1.0

# HIP
python ./ert --verbose=3 Config/config.hip-fp64.iris.jlse.anl.gov.01 
python ./ert --verbose=3 Config/config.hip-fp32.iris.jlse.anl.gov.01 


# OCL
#module purge
#module load intel_compute_runtime


#python ./ert --verbose=3 Config/config.ocl-fp64.iris.jlse.anl.gov.01 
#python ./ert --verbose=3 Config/config.ocl-fp32.iris.jlse.anl.gov.01 




