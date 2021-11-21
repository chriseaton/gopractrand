%module rng
%{
    /* Includes the header in the wrapper code */
    #include <vector>
    #include <string>
    #include <math.h>
    #include <inttypes.h>
    #include "../practrand/include/PractRand/config-swig.h"
    #include "../practrand/include/PractRand_full.h"
    #include "../practrand/include/PractRand/rng_basics.h"
    #include "../practrand/include/PractRand/rng_helpers.h"
%}

%include <typemaps.i>
%include "std_string.i"
// %include "std_vector.i"
// // // This will create 2 wrapped types in Go called
// // // "StringVector" and "ByteVector" for their respective
// // // types.
// namespace std {
//    %template(StringVector) vector<string>;
//    %template(ByteVector) vector<char>;
//    %template(DoubleVector) vector<double>;
// }

namespace PractRand {

    typedef unsigned char Uint8;
	typedef unsigned short int Uint16;
	typedef unsigned int Uint32;
	typedef unsigned long long int Uint64;
	typedef signed char Sint8;
	typedef signed short int Sint16;
	typedef signed int Sint32;
	typedef signed long long int Sint64;

    %ignore randi_fast_implementation(Uint32 random_value, Uint32 max);
    %ignore int_to_rng_seeder(Uint64);
    %ignore *vrng_to_rng_seeder(RNGs::vRNG *);
    %ignore *get_autoseeder(const void *);

    %rename(LeftShiftUInt8) StateWalkingObject::operator<<(Uint8 &v);
    %rename(LeftShiftUInt16) StateWalkingObject::operator<<(Uint16 &v);
    %rename(LeftShiftUInt32) StateWalkingObject::operator<<(Uint32 &v);
    %rename(LeftShiftUInt64) StateWalkingObject::operator<<(Uint64 &v);
    %rename(LeftShiftInt8) StateWalkingObject::operator<<(Sint8 &v);
    %rename(LeftShiftInt16) StateWalkingObject::operator<<(Sint16 &v);
    %rename(LeftShiftInt32) StateWalkingObject::operator<<(Sint32 &v);
    %rename(LeftShiftInt64) StateWalkingObject::operator<<(Sint64 &v);
    %rename(LeftShiftFloat32) StateWalkingObject::operator<<(float &v);
    %rename(LeftShiftFloat64) StateWalkingObject::operator<<(double &v);
    %rename(HandleInt8) StateWalkingObject::handle(Sint8 &v);
    %rename(HandleInt16) StateWalkingObject::handle(Sint16&v);
    %rename(HandleInt32) StateWalkingObject::handle(Sint32&v);
    %rename(HandleInt64) StateWalkingObject::handle(Sint64&v);
    %rename(GetProperties) StateWalkingObject::get_properties() const;
    %rename(IsReadOnly) StateWalkingObject::is_read_only() const;
    %rename(IsWriteOnly) StateWalkingObject::is_write_only() const; 
    %rename(IsClumsy) StateWalkingObject::is_clumsy() const;
    %rename(IsSeeder) StateWalkingObject::is_seeder() const;

    namespace Internals {
        %ignore add_entropy_automatically(PractRand::RNGs::vRNG *entropy_pool, int milliseconds=0 );
    }

    namespace RNGs {
        %rename (AddEntropy8) vRNG::add_entropy8 (Uint8);
        %rename (AddEntropy16) vRNG::add_entropy16(Uint16);
        %rename (AddEntropy32) vRNG::add_entropy32(Uint32);
        %rename (AddEntropy64) vRNG::add_entropy64(Uint64);
        %rename (AddEntropyN) vRNG::add_entropy_N(const void *, size_t length);
        %rename (AddEntropyAuto) vRNG::add_entropy_automatically(int milliseconds = 0);
        %rename (FlushBuffers) vRNG::flush_buffers();
        %rename (GetFlags) vRNG::get_flags() const;
        %rename (GetName) vRNG::get_name() const;
        %rename (GetNativeOutputSize) vRNG::get_native_output_size() const;
        %rename (GaussianFromMeanDev) vRNG::gaussian(double mean, double stddev);
        %rename (SeedFromRNG) vRNG::seed(vRNG *rng);
        %rename (SeedFast) vRNG::seed_fast(Uint64 seed);
        %rename (SeekForward128) vRNG::seek_forward128 (Uint64 how_far_low64, Uint64 how_far_high64);
        %rename (SeekBackward128) vRNG::seek_backward128(Uint64 how_far_low64, Uint64 how_far_high64);
        %rename (SeekForward) vRNG::seek_forward (Uint64 how_far);
        %rename (SeekBackward) vRNG::seek_backward(Uint64 how_far);
        %rename (ResetEntropy) vRNG::reset_entropy();
        %rename (RandiFast) vRNG::randi_fast(Uint32 min, Uint32 max);
        %rename (PrintState) vRNG::print_state();
        %rename (WalkState) vRNG::walk_state(StateWalkingObject *);
        %ignore vRNG::seed(Uint64 seed);
        %ignore vRNG::serialize( size_t *size );
        %ignore vRNG::randi(Uint32 max);
        %ignore vRNG::randi_fast(Uint32 max);
        %ignore vRNG::randli(Uint64 max);
        %ignore vRNG::randf();
        %ignore vRNG::randf(float max);
        %ignore vRNG::randlf();
        %ignore vRNG::randlf(double max);
        %ignore vRNG::add_entropy_automatically();
    }
}

%include "../practrand/include/PractRand/rng_basics.h"
%include "../practrand/include/PractRand/rng_helpers.h"
%include "./arbee.i"
%include "./chacha.i"
%include "./efiix8x48.i"
%include "./efiix16x48.i"
%include "./efiix32x48.i"
%include "./efiix64x48.i"
%include "./salsa.i"