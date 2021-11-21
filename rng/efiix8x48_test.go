package rng

import (
	"testing"
)

func TestNewEfiix8x48(t *testing.T) {
	rng := NewEfiix8x48()
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteEfiix8x48(rng)
}

func TestEfiix8x48Raw(t *testing.T) {
	rng := NewEfiix8x48()
	val := rng.Raw8()
	if val < 0 {
		t.Error("Raw8() returned a negative value.")
	}
	DeleteEfiix8x48(rng)
}

func TestEfiix8x48Seed(t *testing.T) {
	rng := NewEfiix8x48()
	rng.Seed(123123)
	result := rng.Raw8()
	expected := byte(175)
	if result != expected {
		t.Errorf("Seed(uint64) produced a %d value, but %d was expected.", result, expected)
	}
	DeleteEfiix8x48(rng)
}
