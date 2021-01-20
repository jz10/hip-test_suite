#!/bin/bash

module load hip
git checkout origin/HIP

cd FF

make

./ff.ex

cd ../GPP

make

./gpp.ex 
