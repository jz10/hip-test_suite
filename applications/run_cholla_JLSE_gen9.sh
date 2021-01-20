#!/bin/bash +e

#module load openmpi/2.1.6-gcc
module load mpi
module load intel_compute_runtime
module load hipcl
#module list
#export LIBRARY_PATH=$LIBRARY_PATH:/home/bertoni/opt/hdf5/lib/
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/bertoni/opt/hdf5/lib/
#export CPATH=/opt/rocm/include:/opt/rocm/hip/include/:/home/bertoni/opt/hdf5/include/:/soft/libraries/mpi/openmpi/2.1.6/include/

cp cholla_configs/make.host.JLSE-iris cholla/builds/
cd cholla
git checkout CAAR

#module list
export LIBRARY_PATH=$LIBRARY_PATH:/home/bertoni/opt/hdf5/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/bertoni/opt/hdf5/lib/
export HDF5INCLUDE=/home/bertoni/opt/hdf5/include/
export HDF5DIR=/home/bertoni/opt/hdf5

export CC="mpiicc -cc=clang++"
export CXX="mpiicpc -cxx=clang++"
export HIP_PLATFORM=hcc
export OMP_NUM_THREADS=16
export SUFFIX='.hydro-amd-ompi'
export TYPE=hydro

sed -i s^"LIBS += -L\$(ROCM_PATH)/lib -lamdhip64"^"LIBS += -L\$(ROCM_PATH)/lib -lamdhip64\nGPUCXX := clang++\nCXXFLAGS += -std=c++14\nLD := clang++-link\nLDFLAGS := \$(CXXFLAGS) -lOpenCL -lhipcl"^ Makefile
sed -i s^"-Wall --amdgpu-target=gfx906,gfx908 -std=c++14"^"-Wall -std=c++14"^ Makefile
sed -i s^"EXEC := cholla\$(SUFFIX)"^"EXEC := bin/cholla\$(SUFFIX)"^ Makefile

sed -i s^"echo \"unknown\""^"if [[ \$FQDN == *\"iris\"* ]]; then\necho \"JLSE-iris\"\nexit 0\nfi\necho \"unknown\""^ builds/machine.sh

make clean
make

if [ "$?" -eq "0" ];
then
    rm -rf test
    mkdir test
    cd test
    mpirun -np 1 ../cholla.hydro-amd-ompi ../tests/3D/sod.txt
    cd ..
else
    echo "Build failed"
fi

git restore Makefile
git restore builds/machine.sh
