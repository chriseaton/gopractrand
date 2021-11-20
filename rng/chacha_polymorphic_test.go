package rng

import (
	"testing"
)

func TestNewChachaPolymorpic(t *testing.T) {
	rng := NewChachaPolymorphicFromAuto(GetSEED_AUTO())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewChachaPolymorphicFromNone(GetSEED_NONE())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	seed := uint(454)
	rng = NewChachaPolymorphicFromSeedAndIV(&seed, false)
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewChachaPolymorphicFromUInt64(uint64(2342999999999943455))
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteChachaPolymorphic(rng)
}

func TestChachaPolymorphicRaw(t *testing.T) {
	rng := NewChachaPolymorphicFromAuto(GetSEED_AUTO())
	rng.Raw8()
	rng.Raw16()
	rng.Raw32()
	rng.Raw64()
	DeleteChachaPolymorphic(rng)
}

func TestChachaPolymorphicGetFlags(t *testing.T) {
	rng := NewChachaPolymorphicFromAuto(GetSEED_AUTO())
	flags := rng.GetFlags()
	if flags != 28684 {
		t.Errorf("GetFlags() returned %d, but 28684 was expected.", flags)
	}
	DeleteChachaPolymorphic(rng)
}

func TestChachaPolymorphicGetName(t *testing.T) {
	rng := NewChachaPolymorphicFromAuto(GetSEED_AUTO())
	if rng.GetName() != "chacha(20)" {
		t.Errorf("GetName() returned '%s', but 'chacha(20)' was expected.", rng.GetName())
	}
	DeleteChachaPolymorphic(rng)
}

func TestChachaPolymorphicSeed(t *testing.T) {
	rng := NewChachaPolymorphicFromAuto(GetSEED_AUTO())
	rng.SeedFast(123123)
	result := rng.Raw32()
	expected := uint(4072055510)
	if result != expected {
		t.Errorf("SeedFast(uint64) should have produced an expected %d value, but received %d.", expected, result)
	}
	seed := uint(9445355602342343454)
	rng.SeedAndIV(&seed, false)
	result = rng.Raw32()
	expected = uint(2263486148)
	if result != expected {
		t.Errorf("SeedAndIV(uint, bool) should have produced an expected %d value, but received %d.", expected, result)
	}
	rng.SeedShort(&seed, false)
	result = rng.Raw32()
	expected = uint(2833116015)
	if result != expected {
		t.Errorf("SeedShort(uint, bool) should have produced an expected %d value, but received %d.", expected, result)
	}
	DeleteChachaPolymorphic(rng)
}

func TestChachaPolymorphicSeek(t *testing.T) {
	rng := NewChachaPolymorphicFromAuto(GetSEED_AUTO())
	rng.SeekForward(434)
	rng.SeekBackward(111)
	DeleteChachaPolymorphic(rng)
}

func TestChachaPolymorphicRounds(t *testing.T) {
	rng := NewChachaPolymorphicFromAuto(GetSEED_AUTO())
	if rng.GetRounds() != 20 {
		t.Errorf("GetRounds() returned %d, but 20 was expected.", rng.GetRounds())
	}
	rng.SetRounds(100)
	if rng.GetRounds() != 100 {
		t.Errorf("SetRounds() was called, but GetRounds() returned %d, but 100 was expected.", rng.GetRounds())
	}
	DeleteChachaPolymorphic(rng)
}

func TestChachaPolymorphicPrintState(t *testing.T) {
	rng := NewChachaPolymorphicFromAuto(GetSEED_AUTO())
	state := rng.PrintState()
	if state == "" {
		t.Error("PrintState() returned an empty string.")
	}
	DeleteChachaPolymorphic(rng)
}
