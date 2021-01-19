#!/bin/bash


for test_script in $(find . -name run_*JLSE_gen9*)
do
    echo "Running ${test_script}"
    script_name=$(basename ${test_script})
    directory=$(dirname ${test_script})
    cd ${directory}
    ./${script_name}
    cd -

done