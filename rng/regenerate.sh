#!/bin/bash

echo "Building rng package..."
swig -go -cgo -c++ -intgosize 64 rng.i
sed -i '/^#define intgo swig_intgo/i #cgo CFLAGS: -I .\n#cgo LDFLAGS: -L ../practrand/bin -lpractrand\n' rng.go
echo "Running 'go build'..."
go build
echo "Done building rng package."