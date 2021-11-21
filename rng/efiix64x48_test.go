package rng

import (
	"testing"
)

func TestNewEfiix64x48(t *testing.T) {
	rng := NewEfiix64x48()
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteEfiix64x48(rng)
}

func TestEfiix64x48Raw(t *testing.T) {
	rng := NewEfiix64x48()
	val := rng.Raw64()
	if val < 0 {
		t.Error("Raw64() returned a negative value.")
	}
	DeleteEfiix64x48(rng)
}

func TestEfiix64x48Seed(t *testing.T) {
	rng := NewEfiix64x48()
	rng.Seed(25675334)
	result := rng.Raw64()
	expected := uint64(2112063645068497451)
	if result != expected {
		t.Errorf("Seed(uint64) produced a %d value, but %d was expected.", result, expected)
	}
	DeleteEfiix64x48(rng)
}
