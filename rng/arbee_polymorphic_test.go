package rng

import (
	"testing"
)

func TestNewArbeePolymorpic(t *testing.T) {
	rng := NewArbeePolymorphicFromAuto(GetSEED_AUTO())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewArbeePolymorphicFromNone(GetSEED_NONE())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewArbeePolymorphicFromUInt64(4453454)
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewArbeePolymorphicFromUInt64(uint64(2342999999999943455))
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteArbeePolymorphic(rng)
}

func TestArbeePolymorphicRaw(t *testing.T) {
	rng := NewArbeePolymorphicFromAuto(GetSEED_AUTO())
	rng.Raw8()
	rng.Raw16()
	rng.Raw32()
	rng.Raw64()
	DeleteArbeePolymorphic(rng)
}

func TestArbeePolymorphicGetFlags(t *testing.T) {
	rng := NewArbeePolymorphicFromAuto(GetSEED_AUTO())
	flags := rng.GetFlags()
	if flags != 4106 {
		t.Errorf("GetFlags() returned %d, but 4106 was expected.", flags)
	}
	DeleteArbeePolymorphic(rng)
}

func TestArbeePolymorphicGetName(t *testing.T) {
	rng := NewArbeePolymorphicFromAuto(GetSEED_AUTO())
	if rng.GetName() != "arbee" {
		t.Errorf("GetName() returned '%s', but 'arbee' was expected.", rng.GetName())
	}
	DeleteArbeePolymorphic(rng)
}

func TestArbeePolymorphicSeed(t *testing.T) {
	rng := NewArbeePolymorphicFromAuto(GetSEED_AUTO())
	rng.SeedFast(123123)
	result := rng.Raw32()
	expected := uint(3689989285)
	if result != expected {
		t.Errorf("SeedFast(uint64) produced a %d value, but %d was expected.", result, expected)
	}
	rng.Seed(2342, 23424, 2343, 33)
	result = rng.Raw32()
	expected = uint(2466057160)
	if result != expected {
		t.Errorf("Seed(uint64, uint64, uint64, uint64) produced a %d value, but %d was expected.", result, expected)
	}
	DeleteArbeePolymorphic(rng)
}

func TestArbeePolymorphicSeek(t *testing.T) {
	rng := NewArbeePolymorphicFromAuto(GetSEED_AUTO())
	rng.SeekForward(434)
	rng.SeekBackward(111)
	DeleteArbeePolymorphic(rng)
}

func TestArbeePolymorphicPrintState(t *testing.T) {
	rng := NewArbeePolymorphicFromAuto(GetSEED_AUTO())
	state := rng.PrintState()
	if state == "" {
		t.Error("PrintState() returned an empty string.")
	}
	DeleteArbeePolymorphic(rng)
}
