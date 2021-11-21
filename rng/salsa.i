%module rng
%{
    #include "../practrand/include/PractRand/RNGs/salsa.h"
%}

%include <typemaps.i>
%include "std_string.i"

namespace PractRand {

    namespace RNGs {
        namespace Raw {
            %rename (SeedAndIV) salsa::seed(const Uint32 seed_and_iv[10], bool extend_cycle_ = false);
            %rename (SeedShort) salsa::seed_short(const Uint32 seed_and_iv[6], bool extend_cycle_);
            %rename (WalkState) salsa::walk_state(StateWalkingObject *walker);
            %rename (SeekForward) salsa::seek_forward (Uint64 how_far_low, Uint64 how_far_high);
            %rename (SeekBackward) salsa::seek_backward(Uint64 how_far_low, Uint64 how_far_high);
            %rename (SetRounds) salsa::set_rounds(int rounds_);
            %rename (GetRounds) salsa::get_rounds() const;
            %ignore salsa::seed(const Uint32 seed_and_iv[10]);
            %ignore salsa::seed_short(const Uint32 seed_and_iv[6]);
        }
        namespace Polymorphic {
            %rename (SalsaPolymorphic) salsa;
            %rename (SalsaPolymorphicFromUInt64) salsa::salsa(Uint64 s);
            %rename (SalsaPolymorphicFromRNG) salsa::salsa(vRNG *seeder);
            %rename (SalsaPolymorphicFromAuto) salsa::salsa(SEED_AUTO_TYPE);
            %rename (SalsaPolymorphicFromNone) salsa::salsa(SEED_NONE_TYPE);
            %rename (SalsaPolymorphicFromSeedAndIV) salsa::salsa(Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SeedAndIV) salsa::seed(Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SetRounds) salsa::set_rounds(int rounds_);
            %rename (GetRounds) salsa::get_rounds() const;
            %rename (SeedShort) salsa::seed_short(Uint32 seed_and_iv[6], bool extend_cycle_);
            %ignore salsa::salsa(Uint32 seed_and_iv[10]);
            %ignore salsa::seed(Uint32 seed_and_iv[10]);
            %ignore salsa::seed(Uint64 seed);
            %ignore salsa::seed_short(Uint32 seed_and_iv[6]);
        }
    }
}

%include "../practrand/include/PractRand/RNGs/salsa.h"