package rng

import (
	"testing"
)

func TestNewEfiix16x48Polymorpic(t *testing.T) {
	rng := NewEfiix16x48PolymorphicFromAuto(GetSEED_AUTO())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewEfiix16x48PolymorphicFromNone(GetSEED_NONE())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	rng = NewEfiix16x48PolymorphicFromUInt64(uint64(2342999999999943455))
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteEfiix16x48Polymorphic(rng)
}

func TestEfiix16x48PolymorphicRaw(t *testing.T) {
	rng := NewEfiix16x48PolymorphicFromAuto(GetSEED_AUTO())
	rng.Raw8()
	rng.Raw16()
	rng.Raw32()
	rng.Raw64()
	DeleteEfiix16x48Polymorphic(rng)
}

func TestEfiix16x48PolymorphicGetFlags(t *testing.T) {
	rng := NewEfiix16x48PolymorphicFromAuto(GetSEED_AUTO())
	flags := rng.GetFlags()
	if flags != 4488 {
		t.Errorf("GetFlags() returned %d, but 28684 was expected.", flags)
	}
	DeleteEfiix16x48Polymorphic(rng)
}

func TestEfiix16x48PolymorphicGetName(t *testing.T) {
	rng := NewEfiix16x48PolymorphicFromAuto(GetSEED_AUTO())
	if rng.GetName() != "efiix16x48" {
		t.Errorf("GetName() returned '%s', but 'efiix16x48' was expected.", rng.GetName())
	}
	DeleteEfiix16x48Polymorphic(rng)
}

func TestEfiix16x48PolymorphicSeed(t *testing.T) {
	rng := NewEfiix16x48PolymorphicFromAuto(GetSEED_AUTO())
	rng.SeedFast(123123)
	result := rng.Raw32()
	expected := uint(3698949528)
	if result != expected {
		t.Errorf("SeedFast(uint64) produced a %d value, but %d was expected.", result, expected)
	}
	DeleteEfiix16x48Polymorphic(rng)
}

func TestEfiix16x48PolymorphicSeek(t *testing.T) {
	rng := NewEfiix16x48PolymorphicFromAuto(GetSEED_AUTO())
	rng.SeekForward(434)
	rng.SeekBackward(111)
	DeleteEfiix16x48Polymorphic(rng)
}

func TestEfiix16x48PolymorphicPrintState(t *testing.T) {
	rng := NewEfiix16x48PolymorphicFromAuto(GetSEED_AUTO())
	state := rng.PrintState()
	if state == "" {
		t.Error("PrintState() returned an empty string.")
	}
	DeleteEfiix16x48Polymorphic(rng)
}
