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
    #include "../practrand/include/PractRand/RNGs/arbee.h"
%}

%include <typemaps.i>
%include "std_string.i"

namespace PractRand {

    namespace RNGs {
        namespace Raw {
            %rename (SeedAndIV) arbee::seed(const Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SeedShort) arbee::seed_short( const Uint32 seed_and_iv[6], bool extend_cycle_);
            %rename (WalkState) arbee::walk_state(StateWalkingObject *walker);
            %rename (SeekForward) arbee::seek_forward (Uint64 how_far_low, Uint64 how_far_high);
            %rename (SeekBackward) arbee::seek_backward(Uint64 how_far_low, Uint64 how_far_high);
            %rename (SetRounds) arbee::set_rounds(int rounds_);
            %rename (GetRounds) arbee::get_rounds() const;
            %ignore arbee::seed(const Uint32 seed_and_iv[10]);
        }
        namespace Polymorphic {
            %rename (ArbeePolymorphic) arbee;
            %rename (ArbeePolymorphicFromUInt64) arbee::arbee(Uint64 s);
            %rename (ArbeePolymorphicFromRNG) arbee::arbee(vRNG *seeder);
            %rename (ArbeePolymorphicFromAuto) arbee::arbee(SEED_AUTO_TYPE);
            %rename (ArbeePolymorphicFromNone) arbee::arbee(SEED_NONE_TYPE);
            %rename (ArbeePolymorphicFromSeedAndIV) arbee::arbee(Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SeedAndIV) arbee::seed(Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SetRounds) arbee::set_rounds(int rounds_);
            %rename (GetRounds) arbee::get_rounds() const;
            %rename (SeedShort) arbee::seed_short(Uint32 seed_and_iv[6], bool extend_cycle_);
            %ignore arbee::arbee(Uint32 seed_and_iv[10]);
            %ignore arbee::seed(Uint32 seed_and_iv[10]);
            %ignore arbee::seed(Uint64 seed);
            %ignore arbee::seed_short(Uint32 seed_and_iv[6]);
        }
    }
}

%include "../practrand/include/PractRand/RNGs/arbee.h"