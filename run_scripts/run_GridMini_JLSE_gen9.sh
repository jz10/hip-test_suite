# get the definition of timing_check
source timing_check.sh


cd ../proxies/GridMini

git checkout origin/feature/hipify
git reset --hard

git apply ../../run_scripts/patches/GridMini_patch

make

make clean

git reset --hard
