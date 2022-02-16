#!/bin/bash

# in case you forget like me :)
git submodule update --init --recursive

module purge
module load intel_compute_runtime/release/22.02.22151 cmake hiplz/HIAI05-10
export HIPCL_DIR=$HIPLZ_DIR
export CXXFLAGS="-lhiplz -lze_loader"

#module load intel_compute_runtime/release/22.02.22151 cmake hipcl/20210907-experimental13-debug
#export CXXFLAGS="-lhipcl -lOpenCL"



for test_script in $(find . -name run_*JLSE_gen9*)
do
    echo "### Running ${test_script} ###"
    script_name=$(basename ${test_script})
    directory=$(dirname ${test_script})
    cd ${directory}
    timeout -k 9 1800 ./${script_name}
    cd -

done
