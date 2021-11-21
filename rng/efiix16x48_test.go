package rng

import (
	"testing"
)

func TestNewEfiix16x48(t *testing.T) {
	rng := NewEfiix16x48()
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteEfiix16x48(rng)
}

func TestEfiix16x48Raw(t *testing.T) {
	rng := NewEfiix16x48()
	val := rng.Raw16()
	if val < 0 {
		t.Error("Raw8() returned a negative value.")
	}
	DeleteEfiix16x48(rng)
}

func TestEfiix16x48Seed(t *testing.T) {
	rng := NewEfiix16x48()
	rng.Seed(25675334)
	result := rng.Raw16()
	expected := uint16(47578)
	if result != expected {
		t.Errorf("Seed(uint64) produced a %d value, but %d was expected.", result, expected)
	}
	DeleteEfiix16x48(rng)
}
