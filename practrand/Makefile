# Specify extensions of files to delete when cleaning
CLEANEXTS = o so a
SOURCES = src/*.cpp src/RNGs/*.cpp src/RNGs/other/*.cpp
INCLUDE = ./include
OUTPUT_SHARED_LIBRARY = libpractrand.so
OUTPUT_STATIC_LIBRARY = libpractrand.a
OUTPUT_RNG_TEST = rng_test
OUTPUT_RNG_BENCHMARK = rng_benchmark
OUTPUT_RNG_OUTPUT = rng_output
BIN_INSTALL_DIR = /usr/local/bin
LD_INSTALL_CONFIG_FILE = /etc/ld.so.conf.d/practrand.conf
LD_INSTALL_DIR = /usr/lib/practrand

.PHONY: all
all: $(OUTPUT_STATIC_LIBRARY) $(OUTPUT_SHARED_LIBRARY) $(OUTPUT_RNG_TEST) $(OUTPUT_RNG_BENCHMARK) $(OUTPUT_RNG_OUTPUT)
	rm *.o
	@echo
	@echo ✓ The PractRand library and tools have been compiled.

$(OUTPUT_STATIC_LIBRARY): outputs
	mkdir -p bin
	ar rcs ./bin/$(OUTPUT_STATIC_LIBRARY) *.o

$(OUTPUT_SHARED_LIBRARY): outputs
	mkdir -p bin
	gcc -fPIC -Wall -Wextra -shared -o ./bin/$(OUTPUT_SHARED_LIBRARY) *.o

outputs:
	$(CXX) -c $(SOURCES) -fPIC -O3 -I$(INCLUDE) -pthread $(LDFLAGS)

$(OUTPUT_RNG_TEST): $(OUTPUT_STATIC_LIBRARY)
	mkdir -p bin
	g++ -o ./bin/$(OUTPUT_RNG_TEST) tools/RNG_test.cpp ./bin/libpractrand.a -O3 -I$(INCLUDE) -pthread $(LDFLAGS)

$(OUTPUT_RNG_BENCHMARK): $(OUTPUT_STATIC_LIBRARY)
	mkdir -p bin
	g++ -o ./bin/$(OUTPUT_RNG_BENCHMARK) tools/RNG_benchmark.cpp ./bin/libpractrand.a -O3 -I$(INCLUDE) -pthread $(LDFLAGS)

$(OUTPUT_RNG_OUTPUT): $(OUTPUT_STATIC_LIBRARY)
	mkdir -p bin
	g++ -o ./bin/$(OUTPUT_RNG_OUTPUT) tools/RNG_output.cpp ./bin/libpractrand.a -O3 -I$(INCLUDE) -pthread $(LDFLAGS)

.PHONY: install
install:
	mkdir -p $(LD_INSTALL_DIR)
	cp -p ./bin/$(OUTPUT_SHARED_LIBRARY) $(LD_INSTALL_DIR)
	chmod 0755 -R $(LD_INSTALL_DIR)
	echo "$(LD_INSTALL_DIR)" > $(LD_INSTALL_CONFIG_FILE)
	chmod 0744 $(LD_INSTALL_CONFIG_FILE)
	ldconfig
	cp ./bin/$(OUTPUT_RNG_TEST) $(BIN_INSTALL_DIR)
	cp ./bin/$(OUTPUT_RNG_BENCHMARK) $(BIN_INSTALL_DIR)
	cp ./bin/$(OUTPUT_RNG_OUTPUT) $(BIN_INSTALL_DIR)
	@echo
	@echo ✓ The PractRand library and tools have been installed.

.PHONY: clean 
clean:
	for file in $(CLEANEXTS); do rm -f *.$$file; done
	rm -f ./bin/$(OUTPUT_STATIC_LIBRARY) ./bin/$(OUTPUT_SHARED_LIBRARY)
	rm -f ./bin/$(OUTPUT_RNG_TEST) ./bin/$(OUTPUT_RNG_BENCHMARK) ./bin/$(OUTPUT_RNG_OUTPUT)
