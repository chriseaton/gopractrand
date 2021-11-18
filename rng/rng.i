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
    #include "../practrand/include/PractRand/rng_adaptors.h"
    #include "../practrand/include/PractRand/rng_helpers.h"
    #include "../practrand/include/PractRand/RNGs/salsa.h"
    #include "../practrand/include/PractRand/RNGs/sfc16.h"
    #include "../practrand/include/PractRand/RNGs/sfc32.h"
    #include "../practrand/include/PractRand/RNGs/sfc64.h"
    #include "../practrand/include/PractRand/RNGs/sha2_based_pool.h"
    #include "../practrand/include/PractRand/RNGs/trivium.h"
    #include "../practrand/include/PractRand/RNGs/xsm32.h"
    #include "../practrand/include/PractRand/RNGs/xsm64.h"
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
    namespace RNGs {
        namespace Raw {
            %rename (SeedAndIV) salsa::seed(const Uint32 seed_and_iv[10], bool extend_cycle_ = false);
            %ignore salsa::seed(const Uint32 seed_and_iv[10]);
        }
        namespace Polymorphic {
            %rename (PolymorphicSalsa) salsa;
            %rename (PolymorphicSalsaFromUInt64) salsa::salsa(Uint64 s);
            %rename (PolymorphicSalsaFromRNG) salsa::salsa(vRNG *seeder);
            %rename (PolymorphicSalsaFromAuto) salsa::salsa(SEED_AUTO_TYPE);
            %rename (PolymorphicSalsaFromNone) salsa::salsa(SEED_NONE_TYPE);
            %rename (PolymorphicSalsaFromSeedAndIV) salsa::salsa(Uint32 seed_and_iv[10], bool extend_cycle_);
            %ignore salsa::salsa(Uint32 seed_and_iv[10]);
            %rename (SeedAndIV) salsa::seed(Uint32 seed_and_iv[10], bool extend_cycle_);
            %ignore salsa::seed(Uint32 seed_and_iv[10]);
            %rename (PolymorphicSha2Pooled) sha2_based_pool;
            %rename (PolymorphicSha2Pooled) sha2_based_pool::sha2_based_pool();
            %rename (PolymorphicSha2PooledFromUInt64) sha2_based_pool::sha2_based_pool(Uint64 s);
            %rename (PolymorphicSha2PooledFromRNG) sha2_based_pool::sha2_based_pool(vRNG *seeder);
            %rename (PolymorphicSha2PooledFromAuto) sha2_based_pool::sha2_based_pool(SEED_AUTO_TYPE);
            %rename (PolymorphicSha2PooledFromNone) sha2_based_pool::sha2_based_pool(SEED_NONE_TYPE);
        }
    }

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
    %rename(LeftShift) StateWalkingObject::operator<<(Uint8 &v);
    %rename(LeftShift) StateWalkingObject::operator<<(Uint16 &v);
    %rename(LeftShift) StateWalkingObject::operator<<(Uint32 &v);
    %rename(LeftShift) StateWalkingObject::operator<<(Uint64 &v);
    %rename(LeftShift) StateWalkingObject::operator<<(Sint8 &v);
    %rename(LeftShift) StateWalkingObject::operator<<(Sint16 &v);
    %rename(LeftShift) StateWalkingObject::operator<<(Sint32 &v);
    %rename(LeftShift) StateWalkingObject::operator<<(Sint64 &v);
    %rename(LeftShift) StateWalkingObject::operator<<(float &v);
    %rename(LeftShift) StateWalkingObject::operator<<(double &v);
}

%include "../practrand/include/PractRand/rng_basics.h"
%include "../practrand/include/PractRand/rng_helpers.h"
%include "../practrand/include/PractRand/RNGs/salsa.h"
%include "../practrand/include/PractRand/RNGs/sfc16.h"
%include "../practrand/include/PractRand/RNGs/sfc32.h"
%include "../practrand/include/PractRand/RNGs/sfc64.h"
%include "../practrand/include/PractRand/RNGs/sha2_based_pool.h"
%include "../practrand/include/PractRand/RNGs/trivium.h"
%include "../practrand/include/PractRand/RNGs/xsm32.h"
%include "../practrand/include/PractRand/RNGs/xsm64.h"