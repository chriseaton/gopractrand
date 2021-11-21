package rng

import (
	"testing"
)

func TestNewChacha(t *testing.T) {
	rng := NewChacha()
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteChacha(rng)
}

func TestChachaRaw(t *testing.T) {
	rng := NewChacha()
	val := rng.Raw32()
	if val < 0 {
		t.Error("Raw32() returned a negative value.")
	}
	DeleteChacha(rng)
}

func TestChachaSeed(t *testing.T) {
	rng := NewChacha()
	rng.Seed(123123)
	result := rng.Raw32()
	expected := uint(555014420)
	if result != expected {
		t.Errorf("Seed(uint64) produced a %d value, but %d was expected.", result, expected)
	}
	seed := uint(9445355602342343454)
	rng.SeedAndIV(&seed, false)
	result = rng.Raw32()
	expected = uint(2263486148)
	if result != expected {
		t.Errorf("SeedAndIV(uint, bool) produced a %d value, but %d was expected.", result, expected)
	}
	rng.SeedShort(&seed, false)
	result = rng.Raw32()
	expected = uint(2833116015)
	if result != expected {
		t.Errorf("SeedShort(uint, bool) produced a %d value, but %d was expected.", result, expected)
	}
	DeleteChacha(rng)
}

func TestChachaSeek(t *testing.T) {
	rng := NewChacha()
	rng.SeekForward(434, 4344)
	rng.SeekBackward(111, 444)
	DeleteChacha(rng)
}

func TestChachaRounds(t *testing.T) {
	rng := NewChacha()
	if rng.GetRounds() != 20 {
		t.Errorf("GetRounds() returned %d, but 20 was expected.", rng.GetRounds())
	}
	rng.SetRounds(100)
	if rng.GetRounds() != 100 {
		t.Errorf("SetRounds() was called, but GetRounds() returned %d, but 100 was expected.", rng.GetRounds())
	}
	DeleteChacha(rng)
}
