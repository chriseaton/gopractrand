# GoPractRand
This library provides a Go(lang) API wrapper to the well-established and public domain PractRand library which can be used for testing random number generators and randomized datasets.

The primary goal is to provide stable Go-accessible APIs to all tests and random number generators (RNGs) provided in PractRand with minimal modification to the original source library code.

In addition, the main package will provide access to a Test Manager and command-line interface.

## OS Support
Currently this library has only been tested on CentOS 8 Linux, but I suspect it will likely work on other distros without issue. 

> Had success compiling on other distro's or operating systems? Drop me a message and let me know, or submit a PR if you had to make adjustments.

Windows support will come in a future release.

Mac support will need to be provided via PR if someone would like to contribute.

# Building
To utilize this Go package you will need to build and install the PractRand library provided in this repository.

A `Makefile` is provided to facilitate the build and install process in the `practrand/` directory.

```
cd practrand
make
sudo make install
```

This will build and install the `libpractrand.so` shared library and `rng_test`, `rng_benchmark`, `rng_output` command-line tools system-wide.

# Running
To run one of the go library files directly using the built practrand library, run:
```sh
go run main.go 
```
# Goals for v-0.1.0
Complete buildable generated APIs for all RNGs:
- [x] arbee
- [x] chacha
- [ ] efiix8x384
- [x] efiix8x48
- [ ] efiix16x384
- [x] efiix16x48
- [ ] efiix32x384
- [x] efiix32x48
- [ ] efiix64x384
- [x] efiix64x48
- [ ] hc256
- [ ] isaac32x256
- [ ] isaac64x256
- [ ] jsf32
- [ ] jsf64
- [ ] mt19937
- [ ] rarns16
- [ ] rarns32
- [ ] rarns64
- [x] salsa
- [ ] sfc16
- [ ] sfc32
- [ ] sfc64
- [ ] sha2_based_pool
- [ ] trivium
- [ ] xsm32
- [ ] xsm64

## Future Goals
- Test Manager struct to facilitate testing samples.
- Test Manager CLI.
- Complete buildable generated APIs for all Tests:
    - [ ] BCFN
    - [ ] BCFN_MT
    - [ ] Birthday
    - [ ] BRank
    - [ ] coup16
    - [ ] CoupGap
    - [ ] DistC6
    - [ ] DistFreq4
    - [ ] FPF
    - [ ] FPMulti
    - [ ] Gap16
    - [ ] mod3
    - [ ] NearSeq
    - [ ] Pat5
    - [ ] transforms

# Developing
This package is built with Go unit tests in all packages. Run `go test` to run the tests in hhe current package directory.

## Go Wrapper
The Go wrapper for PractRand is provided through a [swig](http://www.swig.org/) generated layer. If you would like to regenerate the Go wrapper code from the library, run the `regenerate.sh` script.