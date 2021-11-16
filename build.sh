#!/bin/bash

read -n 1 -p "Build PractRand (y/n)? " BUILD_PRACTRAND
if [[ $BUILD_PRACTRAND =~ ^[Yy]$ ]]; then
    echo "Building PractRand libraries..."
    mkdir -p bin
    cd practrand
    g++ -c src/*.cpp src/RNGs/*.cpp src/RNGs/other/*.cpp -fpic -O3 -Iinclude -pthread
    ar rcs ../bin/libpractrand.a *.o
    gcc -fPIC -Wall -Wextra -shared -o ../bin/libpractrand.so *.o
    rm *.o
    echo "Building PractRand tools..."
    g++ -o ../bin/rng_test tools/RNG_test.cpp ../bin/libpractrand.a -O3 -Iinclude -pthread
    g++ -o ../bin/rng_benchmark tools/RNG_benchmark.cpp ../bin/libpractrand.a -O3 -Iinclude -pthread
    g++ -o ../bin/rng_output tools/RNG_output.cpp ../bin/libpractrand.a -O3 -Iinclude -pthread
    echo "Done building PractRand."
    cd ..
fi

echo "Building rng package..."
cd rng
swig -go -cgo -c++ -intgosize 64 rng.i
sed -i '/^#define intgo swig_intgo/i #cgo CFLAGS: -I .\n#cgo LDFLAGS: -L ../bin -lpractrand\n' rng.go
echo "Running 'go build'..."
go build
echo "Done building rng package."
cd ..