#!/bin/bash -x

function timing_check() {
    { time $1 ; } 2> out
    cat out
    runtime=$(grep 'real' out | grep "s$" | awk '{print $2}')
    echo "runtime for \"$1\" is" $runtime
    rm out
}
