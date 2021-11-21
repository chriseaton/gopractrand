%module rng
%{
    #include "../practrand/include/PractRand/RNGs/efiix32x48.h"
%}

%include <typemaps.i>
%include "std_string.i"

namespace PractRand {

    namespace RNGs {
        namespace Raw {
            %rename (FlushBuffers) efiix32x48::flush_buffers();
            %rename (SeedAndIV) efiix32x48::seed(const Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SeedFromRNG) efiix32x48::seed(vRNG *rng);
            %rename (SeedFromMix) efiix32x48::seed(Uint64 seed1, Uint64 seed2, Uint64 seed3, Uint64 seed4);
            %rename (SeedShort) efiix32x48::seed_short( const Uint32 seed_and_iv[6], bool extend_cycle_);
            %rename (WalkState) efiix32x48::walk_state(StateWalkingObject *walker);
            %rename (SeekForward) efiix32x48::seek_forward (Uint64 how_far_low, Uint64 how_far_high);
            %rename (SeekBackward) efiix32x48::seek_backward(Uint64 how_far_low, Uint64 how_far_high);
            %rename (SetRounds) efiix32x48::set_rounds(int rounds_);
            %rename (ResetEntropy) efiix32x48::reset_entropy();
            %rename (GetRounds) efiix32x48::get_rounds() const;
            %rename (AddEntropy8) efiix32x48::add_entropy8 (Uint8);
            %rename (AddEntropy16) efiix32x48::add_entropy16(Uint16);
            %rename (AddEntropy32) efiix32x48::add_entropy32(Uint32);
            %rename (AddEntropy64) efiix32x48::add_entropy64(Uint64);
            %rename (AddEntropyN) efiix32x48::add_entropy_N(const void *, size_t length);
            %ignore efiix32x48::seed(const Uint32 seed_and_iv[10]);
            %ignore efiix32x48::seed_short(const Uint32 seed_and_iv[6]);
        }
        namespace Polymorphic {
            %rename (Efiix32x48Polymorphic) efiix32x48;
            %rename (Efiix32x48PolymorphicFromUInt64) efiix32x48::efiix32x48(Uint64 s);
            %rename (Efiix32x48PolymorphicFromRNG) efiix32x48::efiix32x48(vRNG *seeder);
            %rename (Efiix32x48PolymorphicFromAuto) efiix32x48::efiix32x48(SEED_AUTO_TYPE);
            %rename (Efiix32x48PolymorphicFromNone) efiix32x48::efiix32x48(SEED_NONE_TYPE);
            %rename (Efiix32x48PolymorphicFromSeedAndIV) efiix32x48::efiix32x48(Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SeedAndIV) efiix32x48::seed(Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SetRounds) efiix32x48::set_rounds(int rounds_);
            %rename (GetRounds) efiix32x48::get_rounds() const;
            %rename (SeedShort) efiix32x48::seed_short(Uint32 seed_and_iv[6], bool extend_cycle_);
            %ignore efiix32x48::efiix32x48(Uint32 seed_and_iv[10]);
            %ignore efiix32x48::seed(Uint32 seed_and_iv[10]);
            %ignore efiix32x48::seed(Uint64 seed);
            %ignore efiix32x48::seed_short(Uint32 seed_and_iv[6]);
        }
    }
}

%include "../practrand/include/PractRand/RNGs/efiix32x48.h"