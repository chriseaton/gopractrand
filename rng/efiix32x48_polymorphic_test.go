package rng

import (
	"testing"
)

func TestNewEfiix32x48Polymorpic(t *testing.T) {
	rng := NewEfiix32x48PolymorphicFromAuto(GetSEED_AUTO())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewEfiix32x48PolymorphicFromNone(GetSEED_NONE())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewEfiix32x48PolymorphicFromUInt64(uint64(2342999999999943455))
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteEfiix32x48Polymorphic(rng)
}

func TestEfiix32x48PolymorphicRaw(t *testing.T) {
	rng := NewEfiix32x48PolymorphicFromAuto(GetSEED_AUTO())
	rng.Raw8()
	rng.Raw16()
	rng.Raw32()
	rng.Raw64()
	DeleteEfiix32x48Polymorphic(rng)
}

func TestEfiix32x48PolymorphicGetFlags(t *testing.T) {
	rng := NewEfiix32x48PolymorphicFromAuto(GetSEED_AUTO())
	flags := rng.GetFlags()
	if flags != 4488 {
		t.Errorf("GetFlags() returned %d, but 28684 was expected.", flags)
	}
	DeleteEfiix32x48Polymorphic(rng)
}

func TestEfiix32x48PolymorphicGetName(t *testing.T) {
	rng := NewEfiix32x48PolymorphicFromAuto(GetSEED_AUTO())
	if rng.GetName() != "efiix32x48" {
		t.Errorf("GetName() returned '%s', but 'efiix32x48' was expected.", rng.GetName())
	}
	DeleteEfiix32x48Polymorphic(rng)
}

func TestEfiix32x48PolymorphicSeed(t *testing.T) {
	rng := NewEfiix32x48PolymorphicFromAuto(GetSEED_AUTO())
	rng.SeedFast(123123)
	result := rng.Raw32()
	expected := uint(3605101976)
	if result != expected {
		t.Errorf("SeedFast(uint64) produced a %d value, but %d was expected.", result, expected)
	}
	DeleteEfiix32x48Polymorphic(rng)
}

func TestEfiix32x48PolymorphicSeek(t *testing.T) {
	rng := NewEfiix32x48PolymorphicFromAuto(GetSEED_AUTO())
	rng.SeekForward(434)
	rng.SeekBackward(111)
	DeleteEfiix32x48Polymorphic(rng)
}

func TestEfiix32x48PolymorphicPrintState(t *testing.T) {
	rng := NewEfiix32x48PolymorphicFromAuto(GetSEED_AUTO())
	state := rng.PrintState()
	if state == "" {
		t.Error("PrintState() returned an empty string.")
	}
	DeleteEfiix32x48Polymorphic(rng)
}
