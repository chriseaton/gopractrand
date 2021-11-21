%module rng
%{
    #include "../practrand/include/PractRand/RNGs/efiix64x48.h"
%}

%include <typemaps.i>
%include "std_string.i"

namespace PractRand {

    namespace RNGs {
        namespace Raw {
            %rename (FlushBuffers) efiix64x48::flush_buffers();
            %rename (SeedAndIV) efiix64x48::seed(const Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SeedFromRNG) efiix64x48::seed(vRNG *rng);
            %rename (SeedFromMix) efiix64x48::seed(Uint64 seed1, Uint64 seed2, Uint64 seed3, Uint64 seed4);
            %rename (SeedShort) efiix64x48::seed_short( const Uint32 seed_and_iv[6], bool extend_cycle_);
            %rename (WalkState) efiix64x48::walk_state(StateWalkingObject *walker);
            %rename (SeekForward) efiix64x48::seek_forward (Uint64 how_far_low, Uint64 how_far_high);
            %rename (SeekBackward) efiix64x48::seek_backward(Uint64 how_far_low, Uint64 how_far_high);
            %rename (SetRounds) efiix64x48::set_rounds(int rounds_);
            %rename (ResetEntropy) efiix64x48::reset_entropy();
            %rename (GetRounds) efiix64x48::get_rounds() const;
            %rename (AddEntropy8) efiix64x48::add_entropy8 (Uint8);
            %rename (AddEntropy16) efiix64x48::add_entropy16(Uint16);
            %rename (AddEntropy32) efiix64x48::add_entropy32(Uint32);
            %rename (AddEntropy64) efiix64x48::add_entropy64(Uint64);
            %rename (AddEntropyN) efiix64x48::add_entropy_N(const void *, size_t length);
            %ignore efiix64x48::seed(const Uint32 seed_and_iv[10]);
            %ignore efiix64x48::seed_short(const Uint32 seed_and_iv[6]);
        }
        namespace Polymorphic {
            %rename (Efiix64x48Polymorphic) efiix64x48;
            %rename (Efiix64x48PolymorphicFromUInt64) efiix64x48::efiix64x48(Uint64 s);
            %rename (Efiix64x48PolymorphicFromRNG) efiix64x48::efiix64x48(vRNG *seeder);
            %rename (Efiix64x48PolymorphicFromAuto) efiix64x48::efiix64x48(SEED_AUTO_TYPE);
            %rename (Efiix64x48PolymorphicFromNone) efiix64x48::efiix64x48(SEED_NONE_TYPE);
            %rename (Efiix64x48PolymorphicFromSeedAndIV) efiix64x48::efiix64x48(Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SeedAndIV) efiix64x48::seed(Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SetRounds) efiix64x48::set_rounds(int rounds_);
            %rename (GetRounds) efiix64x48::get_rounds() const;
            %rename (SeedShort) efiix64x48::seed_short(Uint32 seed_and_iv[6], bool extend_cycle_);
            %ignore efiix64x48::efiix64x48(Uint32 seed_and_iv[10]);
            %ignore efiix64x48::seed(Uint32 seed_and_iv[10]);
            %ignore efiix64x48::seed(Uint64 seed);
            %ignore efiix64x48::seed_short(Uint32 seed_and_iv[6]);
        }
    }
}

%include "../practrand/include/PractRand/RNGs/efiix64x48.h"