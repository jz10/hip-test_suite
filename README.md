This repository is allocated for HIP related developers to share the test suites.
# HIP Test Suite

Right now the test set is composed of four high-level directories as git submodules:
- HIP-Examples (official HIP examples)
- applications (full applications using HIP)
- benchmarks (conformance and performance benchmarks)
- proxies (proxy applications)

The directory structure looks like:
```
.
├── HIP-Examples
├── applications
├── benchmarks
│   └── performance
│       ├── BabelStream
│       ├── cs-roofline-toolkit
│       └── rocHPCG
└── proxies
    ├── KokkosDslash
    ├── miniWeather
    └── su3_bench
```

Since we use submodules, to clone all the submodules, you'll need to use 

```
git clone https://github.com/jz10/hip-test_suite
cd hip-test_suite
git submodule update --init --recursive
```

To update the submodules to the latest:
Enter the submodule directory:
```
cd projB/projA
```
Pull the repo from you project A (will not update the git status of your parent, project B):
```
git pull origin master
```
Go back to the root directory & check update:
```
cd ..
git status
```
If the submodule updated before, it will show something like below:
```
# Not currently on any branch.
# Changed but not updated:
#   (use "git add ..." to update what will be committed)
#   (use "git checkout -- ..." to discard changes in working directory)
#
#       modified:   projB/projA (new commits)
#
```
Then, commit the update:
```
git add projB/projA
git commit -m "projA submodule updated"
```
(From https://stackoverflow.com/questions/8191299/update-a-submodule-to-the-latest-commit)
