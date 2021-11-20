package rng

import (
	"testing"
)

func TestNewSalsaPolymorpic(t *testing.T) {
	rng := NewSalsaPolymorphicFromAuto(GetSEED_AUTO())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewSalsaPolymorphicFromNone(GetSEED_NONE())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	seed := uint(454)
	rng = NewSalsaPolymorphicFromSeedAndIV(&seed, false)
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewSalsaPolymorphicFromUInt64(uint64(2342999999999943455))
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteSalsaPolymorphic(rng)
}

func TestSalsaPolymorphicRaw(t *testing.T) {
	rng := NewSalsaPolymorphicFromAuto(GetSEED_AUTO())
	rng.Raw8()
	rng.Raw16()
	rng.Raw32()
	rng.Raw64()
	DeleteSalsaPolymorphic(rng)
}

func TestSalsaPolymorphicGetFlags(t *testing.T) {
	rng := NewSalsaPolymorphicFromAuto(GetSEED_AUTO())
	flags := rng.GetFlags()
	if flags != 28684 {
		t.Errorf("GetFlags() returned %d, but 28684 was expected.", flags)
	}
	DeleteSalsaPolymorphic(rng)
}

func TestSalsaPolymorphicGetName(t *testing.T) {
	rng := NewSalsaPolymorphicFromAuto(GetSEED_AUTO())
	if rng.GetName() != "salsa(20)" {
		t.Errorf("GetName() returned '%s', but 'salsa(20)' was expected.", rng.GetName())
	}
	DeleteSalsaPolymorphic(rng)
}

func TestSalsaPolymorphicSeed(t *testing.T) {
	rng := NewSalsaPolymorphicFromAuto(GetSEED_AUTO())
	rng.SeedFast(123123)
	if rng.Raw32() != 2695039661 {
		t.Errorf("SeedFast(uint64) should have produced an expected value.")
	}
	seed := uint(9445355602342343454)
	if rng.Raw32() != 3528021007 {
		t.Errorf("SeedAndIV(uint, bool) should have produced an expected value.")
	}
	rng.SeedShort(&seed, false)
	if rng.Raw32() != 1592220107 {
		t.Errorf("SeedShort(uint, bool) should have produced an expected value.")
	}
	DeleteSalsaPolymorphic(rng)
}

func TestSalsaPolymorphicSeek(t *testing.T) {
	rng := NewSalsaPolymorphicFromAuto(GetSEED_AUTO())
	rng.SeekForward(434)
	rng.SeekBackward(111)
	DeleteSalsaPolymorphic(rng)
}

func TestSalsaPolymorphicRounds(t *testing.T) {
	rng := NewSalsaPolymorphicFromAuto(GetSEED_AUTO())
	if rng.GetRounds() != 20 {
		t.Errorf("GetRounds() returned %d, but 20 was expected.", rng.GetRounds())
	}
	rng.SetRounds(100)
	if rng.GetRounds() != 100 {
		t.Errorf("SetRounds() was called, but GetRounds() returned %d, but 100 was expected.", rng.GetRounds())
	}
	DeleteSalsaPolymorphic(rng)
}

func TestSalsaPolymorphicPrintState(t *testing.T) {
	rng := NewSalsaPolymorphicFromAuto(GetSEED_AUTO())
	state := rng.PrintState()
	if state == "" {
		t.Error("PrintState() returned an empty string.")
	}
	DeleteSalsaPolymorphic(rng)
}
