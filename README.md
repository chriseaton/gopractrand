# GoPractRand
This library provides a go(lang) API layer to the well-established and public domain PractRand library developed by Chris Doty-Humphrey which can be used for testing random number generators and randomized datasets.

The primary goal is to provide stable Go-accessible APIs to all tests and rngs provided in PractRand with minimal modification to the original source library code.

PractRand is compiled into a shared library that is linked through a [swig](http://www.swig.org/) generated layer for go.

## OS Support
Currently this library has only been tested on Linux. 
Windows support will come in a future release, or feel free to submit a PR.
Mac support will need to be provided via PR as I do not have a Mac to build/test on.

# Building
Currently, the easiest way to get the library built is to simply run the `build.sh` script. This will build the
PractRand shared library and command-line tools, and regenerate cgo API files.

# Running
To run one of the go library files directly using the built practrand library, run:
```sh
LD_LIBRARY_PATH=./bin/ go run main.go 
```
# Goals for v-0.1.0
Complete buildable generated APIs for all RNGs:
- [ ] arbee
- [ ] chacha
- [ ] efiix16x384
- [ ] efiix16x48
- [ ] efiix32x384
- [ ] efiix32x48
- [ ] efiix64x384
- [ ] efiix64x48
- [ ] efiix8x384
- [ ] efiix8x48
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
- [x] sfc16
- [ ] sfc32
- [ ] sfc64
- [ ] sha2_based_pool
- [ ] trivium
- [ ] xsm32
- [ ] xsm64

Complete buildable generated APIs for all Tests:
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