#!/bin/bash

git checkout CAAR
module load hip
export POISSON_SOLVER='-DPARIS'
export SUFFIX='.paris-cuda'
export TYPE=gravity
export LIBRARY_PATH=$LIBRARY_PATH:/home/bertoni/opt/hdf5/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/bertoni/opt/hdf5/lib/
HDF5INCLUDE=/home/bertoni/opt/hdf5/include/  HDF5DIR=/home/bertoni/opt/hdf5 make
 ./cholla tests/1D/Sod.txt
