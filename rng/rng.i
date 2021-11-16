%module rng
%{
    /* Includes the header in the wrapper code */
    #include <vector>
    #include <string>
    #include <math.h>
    #include <inttypes.h>
    #include "../practrand/include/PractRand/config-swig.h"
    #include "../practrand/include/PractRand_full.h"
    #include "../practrand/include/PractRand/rng_adaptors.h"
    #include "../practrand/include/PractRand/rng_helpers.h"
    #include "../practrand/include/PractRand/RNGs/salsa.h"
    #include "../practrand/include/PractRand/RNGs/sfc16.h"
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

        }
    }

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

%include "../practrand/include/PractRand/rng_helpers.h"
%include "../practrand/include/PractRand/RNGs/salsa.h"
%include "../practrand/include/PractRand/RNGs/sfc16.h"