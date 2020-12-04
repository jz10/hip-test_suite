#!/bin/bash

git checkout HIP
module load hip
LIBRARY_PATH=$LIBRARY_PATH:/home/bertoni/opt/hdf5/lib/ HDF5INCLUDE=/home/bertoni/opt/hdf5/include/  HDF5DIR=/home/bertoni/opt/hdf5 make
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/bertoni/opt/hdf5/lib/ ./cholla tests/1D/Sod.txt
