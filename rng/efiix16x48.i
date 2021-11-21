%module rng
%{
    #include "../practrand/include/PractRand/RNGs/efiix16x48.h"
%}

%include <typemaps.i>
%include "std_string.i"

namespace PractRand {

    namespace RNGs {
        namespace Raw {
            %rename (FlushBuffers) efiix16x48::flush_buffers();
            %rename (SeedAndIV) efiix16x48::seed(const Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SeedFromRNG) efiix16x48::seed(vRNG *rng);
            %rename (SeedFromMix) efiix16x48::seed(Uint64 seed1, Uint64 seed2, Uint64 seed3, Uint64 seed4);
            %rename (SeedShort) efiix16x48::seed_short( const Uint32 seed_and_iv[6], bool extend_cycle_);
            %rename (WalkState) efiix16x48::walk_state(StateWalkingObject *walker);
            %rename (SeekForward) efiix16x48::seek_forward (Uint64 how_far_low, Uint64 how_far_high);
            %rename (SeekBackward) efiix16x48::seek_backward(Uint64 how_far_low, Uint64 how_far_high);
            %rename (SetRounds) efiix16x48::set_rounds(int rounds_);
            %rename (ResetEntropy) efiix16x48::reset_entropy();
            %rename (GetRounds) efiix16x48::get_rounds() const;
            %rename (AddEntropy8) efiix16x48::add_entropy8 (Uint8);
            %rename (AddEntropy16) efiix16x48::add_entropy16(Uint16);
            %rename (AddEntropy32) efiix16x48::add_entropy32(Uint32);
            %rename (AddEntropy64) efiix16x48::add_entropy64(Uint64);
            %rename (AddEntropyN) efiix16x48::add_entropy_N(const void *, size_t length);
            %ignore efiix16x48::seed(const Uint32 seed_and_iv[10]);
            %ignore efiix16x48::seed_short(const Uint32 seed_and_iv[6]);
        }
        namespace Polymorphic {
            %rename (Efiix16x48Polymorphic) efiix16x48;
            %rename (Efiix16x48PolymorphicFromUInt64) efiix16x48::efiix16x48(Uint64 s);
            %rename (Efiix16x48PolymorphicFromRNG) efiix16x48::efiix16x48(vRNG *seeder);
            %rename (Efiix16x48PolymorphicFromAuto) efiix16x48::efiix16x48(SEED_AUTO_TYPE);
            %rename (Efiix16x48PolymorphicFromNone) efiix16x48::efiix16x48(SEED_NONE_TYPE);
            %rename (Efiix16x48PolymorphicFromSeedAndIV) efiix16x48::efiix16x48(Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SeedAndIV) efiix16x48::seed(Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SetRounds) efiix16x48::set_rounds(int rounds_);
            %rename (GetRounds) efiix16x48::get_rounds() const;
            %rename (SeedShort) efiix16x48::seed_short(Uint32 seed_and_iv[6], bool extend_cycle_);
            %ignore efiix16x48::efiix16x48(Uint32 seed_and_iv[10]);
            %ignore efiix16x48::seed(Uint32 seed_and_iv[10]);
            %ignore efiix16x48::seed(Uint64 seed);
            %ignore efiix16x48::seed_short(Uint32 seed_and_iv[6]);
        }
    }
}

%include "../practrand/include/PractRand/RNGs/efiix16x48.h"