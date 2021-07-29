This repository is allocated for HIP related developers to share the test suites.
# HIP Test Suite

Right now the test set is composed of four high-level directories as git submodules:
- HIP-Examples (official HIP examples)
- applications (full applications using HIP)
- benchmarks (conformance and performance benchmarks)
- frameworks (programming portability layers like Kokkos and RAJA)
- proxies (proxy applications)

The directory structure looks like:
```
├── HIP-Examples
├── applications
│   ├── cholla
├── benchmarks
│   ├── conformance
│   │   └── HIP
│   └── performance
│       ├── BabelStream
│       ├── ERT_configs
│       ├── cs-roofline-toolkit
├── frameworks
│   ├── RAJA
│   ├── kokkos
│   ├── occa
├── proxies
│   ├── BerkeleyGW-Kernels-CPP
│   ├── KokkosDslash
│   ├── adept-proxy
│   └── su3_bench
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

# Running the tests on JLSE

To run on gen9 on JLSE:

```
$ ./run_tests.sh
```

This just executes all the tests in the subdirectories matching `run_*JLSE_gen9*`, 
and prints output to stdout.

# Adding another repo as a submodule

```
$ git submodule add https://github.com/chaconinc/DbConnector
$ git commit -am 'Add DbConnector module'
```

# Removing a submodule

```
$ git rm the_submodule
$ rm -rf .git/modules/the_submodule
```
