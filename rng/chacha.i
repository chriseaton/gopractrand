%module rng
%{
    #include "../practrand/include/PractRand/RNGs/chacha.h"
%}

%include <typemaps.i>
%include "std_string.i"

namespace PractRand {

    namespace RNGs {
        namespace Raw {
            %rename (FlushBuffers) chacha::flush_buffers();
            %rename (SeedAndIV) chacha::seed(const Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SeedFromRNG) chacha::seed(vRNG *rng);
            %rename (SeedFromMix) chacha::seed(Uint64 seed1, Uint64 seed2, Uint64 seed3, Uint64 seed4);
            %rename (SeedShort) chacha::seed_short( const Uint32 seed_and_iv[6], bool extend_cycle_);
            %rename (WalkState) chacha::walk_state(StateWalkingObject *walker);
            %rename (SeekForward) chacha::seek_forward (Uint64 how_far_low, Uint64 how_far_high);
            %rename (SeekBackward) chacha::seek_backward(Uint64 how_far_low, Uint64 how_far_high);
            %rename (SetRounds) chacha::set_rounds(int rounds_);
            %rename (ResetEntropy) chacha::reset_entropy();
            %rename (GetRounds) chacha::get_rounds() const;
            %rename (AddEntropy8) chacha::add_entropy8 (Uint8);
            %rename (AddEntropy16) chacha::add_entropy16(Uint16);
            %rename (AddEntropy32) chacha::add_entropy32(Uint32);
            %rename (AddEntropy64) chacha::add_entropy64(Uint64);
            %rename (AddEntropyN) chacha::add_entropy_N(const void *, size_t length);
            %ignore chacha::seed(const Uint32 seed_and_iv[10]);
            %ignore chacha::seed_short(const Uint32 seed_and_iv[6]);
        }
        namespace Polymorphic {
            %rename (ChachaPolymorphic) chacha;
            %rename (ChachaPolymorphicFromUInt64) chacha::chacha(Uint64 s);
            %rename (ChachaPolymorphicFromRNG) chacha::chacha(vRNG *seeder);
            %rename (ChachaPolymorphicFromAuto) chacha::chacha(SEED_AUTO_TYPE);
            %rename (ChachaPolymorphicFromNone) chacha::chacha(SEED_NONE_TYPE);
            %rename (ChachaPolymorphicFromSeedAndIV) chacha::chacha(Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SeedAndIV) chacha::seed(Uint32 seed_and_iv[10], bool extend_cycle_);
            %rename (SetRounds) chacha::set_rounds(int rounds_);
            %rename (GetRounds) chacha::get_rounds() const;
            %rename (SeedShort) chacha::seed_short(Uint32 seed_and_iv[6], bool extend_cycle_);
            %ignore chacha::chacha(Uint32 seed_and_iv[10]);
            %ignore chacha::seed(Uint32 seed_and_iv[10]);
            %ignore chacha::seed(Uint64 seed);
            %ignore chacha::seed_short(Uint32 seed_and_iv[6]);
        }
    }
}

%include "../practrand/include/PractRand/RNGs/chacha.h"