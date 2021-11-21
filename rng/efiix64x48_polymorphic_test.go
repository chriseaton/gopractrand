package rng

import (
	"testing"
)

func TestNewEfiix64x48Polymorpic(t *testing.T) {
	rng := NewEfiix64x48PolymorphicFromAuto(GetSEED_AUTO())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewEfiix64x48PolymorphicFromNone(GetSEED_NONE())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewEfiix64x48PolymorphicFromUInt64(uint64(2342999999999943455))
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteEfiix64x48Polymorphic(rng)
}

func TestEfiix64x48PolymorphicRaw(t *testing.T) {
	rng := NewEfiix64x48PolymorphicFromAuto(GetSEED_AUTO())
	rng.Raw8()
	rng.Raw16()
	rng.Raw32()
	rng.Raw64()
	DeleteEfiix64x48Polymorphic(rng)
}

func TestEfiix64x48PolymorphicGetFlags(t *testing.T) {
	rng := NewEfiix64x48PolymorphicFromAuto(GetSEED_AUTO())
	flags := rng.GetFlags()
	if flags != 4488 {
		t.Errorf("GetFlags() returned %d, but 28684 was expected.", flags)
	}
	DeleteEfiix64x48Polymorphic(rng)
}

func TestEfiix64x48PolymorphicGetName(t *testing.T) {
	rng := NewEfiix64x48PolymorphicFromAuto(GetSEED_AUTO())
	if rng.GetName() != "efiix64x48" {
		t.Errorf("GetName() returned '%s', but 'efiix64x48' was expected.", rng.GetName())
	}
	DeleteEfiix64x48Polymorphic(rng)
}

func TestEfiix64x48PolymorphicSeed(t *testing.T) {
	rng := NewEfiix64x48PolymorphicFromAuto(GetSEED_AUTO())
	rng.SeedFast(123123)
	result := rng.Raw32()
	expected := uint(3605101976)
	if result != expected {
		t.Errorf("SeedFast(uint64) produced a %d value, but %d was expected.", result, expected)
	}
	DeleteEfiix64x48Polymorphic(rng)
}

func TestEfiix64x48PolymorphicSeek(t *testing.T) {
	rng := NewEfiix64x48PolymorphicFromAuto(GetSEED_AUTO())
	rng.SeekForward(434)
	rng.SeekBackward(111)
	DeleteEfiix64x48Polymorphic(rng)
}

func TestEfiix64x48PolymorphicPrintState(t *testing.T) {
	rng := NewEfiix64x48PolymorphicFromAuto(GetSEED_AUTO())
	state := rng.PrintState()
	if state == "" {
		t.Error("PrintState() returned an empty string.")
	}
	DeleteEfiix64x48Polymorphic(rng)
}
