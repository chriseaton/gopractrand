package rng

import (
	"testing"
)

func TestNewEfiix32x48(t *testing.T) {
	rng := NewEfiix32x48()
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteEfiix32x48(rng)
}

func TestEfiix32x48Raw(t *testing.T) {
	rng := NewEfiix32x48()
	val := rng.Raw32()
	if val < 0 {
		t.Error("Raw32() returned a negative value.")
	}
	DeleteEfiix32x48(rng)
}

func TestEfiix32x48Seed(t *testing.T) {
	rng := NewEfiix32x48()
	rng.Seed(25675334)
	result := rng.Raw32()
	expected := uint(2164727099)
	if result != expected {
		t.Errorf("Seed(uint64) produced a %d value, but %d was expected.", result, expected)
	}
	DeleteEfiix32x48(rng)
}
