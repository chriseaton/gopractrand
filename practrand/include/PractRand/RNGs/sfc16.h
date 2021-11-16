namespace PractRand {
	namespace RNGs {
		namespace Raw {
			//implemented in RNGs/sfc.cpp
			class sfc16 {
			public:
				enum {
					OUTPUT_TYPE = OUTPUT_TYPES::NORMAL_1,
					OUTPUT_BITS = 16,
					FLAGS = FLAG::ENDIAN_SAFE | FLAG::USES_SPECIFIED
				};
			protected:
				Uint16 a, b, c, counter;
			public:
				Uint16 raw16();
				void seed(Uint64 s);
				void seed_fast(Uint64 s);
				void seed(Uint16 s1, Uint16 s2, Uint16 s3);
				void walk_state(StateWalkingObject *walker);
			};
		}
		
		namespace Polymorphic {
			class sfc16 : public vRNG16 {
				public:
                    enum {OUTPUT_TYPE = OUTPUT_TYPES::NORMAL_ALL,OUTPUT_BITS = Raw::sfc16::OUTPUT_BITS,FLAGS = Raw::sfc16::FLAGS};
                    Raw::sfc16 implementation;
                    sfc16 (Uint64 s) {seed(s);}
                    sfc16 (vRNG *seeder) {seed(seeder);}
                    sfc16 (SEED_AUTO_TYPE ) {autoseed();}
                    sfc16 (SEED_NONE_TYPE ) {}
                    Uint8  raw8 ();
                    Uint16 raw16();
                    Uint32 raw32();
                    Uint64 raw64();
                    using vRNG::seed;
                    Uint64 get_flags() const;
                    std::string get_name() const;
                    void walk_state(StateWalkingObject *walker);
				void seed(Uint64 s);
				void seed_fast(Uint64 s);
				void seed(Uint16 s1, Uint16 s2, Uint16 s3);
			};
		}
        namespace LightWeight {
            typedef PractRand::RNGs::Adaptors::RAW_TO_LIGHT_WEIGHT_RNG<PractRand::RNGs::Raw::sfc16 > sfc16;
        }
	}
}
