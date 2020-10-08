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
