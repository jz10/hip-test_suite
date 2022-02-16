# get the definition of timing_check
source timing_check.sh


cd ../proxies/RSBench/hip

git apply ../../../run_scripts/patches/RSBench_patch

make clean

make

./rsbench -m event -s small

make clean

git reset --hard
