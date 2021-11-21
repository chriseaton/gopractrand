package rng

import (
	"testing"
)

func TestNewArbee(t *testing.T) {
	rng := NewArbee()
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteArbee(rng)
}

func TestArbeeRaw(t *testing.T) {
	rng := NewArbee()
	val := rng.Raw32()
	if val < 0 {
		t.Error("Raw32() returned a negative value.")
	}
	DeleteArbee(rng)
}

func TestArbeeSeed(t *testing.T) {
	rng := NewArbee()
	rng.Seed(123123)
	result := rng.Raw32()
	expected := uint(1688777746)
	if result != expected {
		t.Errorf("Seed(uint64) produced a %d value, but %d was expected.", result, expected)
	}
	rng.SeedFromMix(32, 44344455, 34334, 4422)
	result = rng.Raw32()
	expected = uint(4259917038)
	if result != expected {
		t.Errorf("SeedFromMix(uint64, uint64, uint64, uint64) produced a %d value, but %d was expected.", result, expected)
	}
	DeleteArbee(rng)
}
