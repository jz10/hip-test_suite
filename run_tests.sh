#!/bin/bash

# in case you forget like me :)
git submodule update --init --recursive

for test_script in $(find . -name run_*JLSE_gen9*)
do
    echo "### Running ${test_script} ###"
    script_name=$(basename ${test_script})
    directory=$(dirname ${test_script})
    cd ${directory}
    timeout -k 9 1800 ./${script_name}
    cd -

done
