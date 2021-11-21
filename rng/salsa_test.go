package rng

import (
	"testing"
)

func TestNewSalsa(t *testing.T) {
	rng := NewSalsa()
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeleteSalsa(rng)
}

func TestSalsaRaw(t *testing.T) {
	rng := NewSalsa()
	val := rng.Raw32()
	if val < 0 {
		t.Error("Raw32() returned a negative value.")
	}
	DeleteSalsa(rng)
}

func TestSalsaSeed(t *testing.T) {
	rng := NewSalsa()
	rng.Seed(123123)
	result := rng.Raw32()
	expected := uint(2225711153)
	if result != expected {
		t.Errorf("Seed(uint64) produced a %d value, but %d was expected.", result, expected)
	}
	seed := uint(9445355602342343454)
	rng.SeedAndIV(&seed, false)
	result = rng.Raw32()
	expected = uint(1592220107)
	if result != expected {
		t.Errorf("SeedAndIV(uint, bool) produced a %d value, but %d was expected.", result, expected)
	}
	rng.SeedShort(&seed, false)
	result = rng.Raw32()
	expected = uint(1307139995)
	if result != expected {
		t.Errorf("SeedShort(uint, bool) produced a %d value, but %d was expected.", result, expected)
	}
	DeleteSalsa(rng)
}

func TestSalsaSeek(t *testing.T) {
	rng := NewSalsa()
	rng.SeekForward(434, 4344)
	rng.SeekBackward(111, 444)
	DeleteSalsa(rng)
}

func TestSalsaRounds(t *testing.T) {
	rng := NewSalsa()
	if rng.GetRounds() != 20 {
		t.Errorf("GetRounds() returned %d, but 20 was expected.", rng.GetRounds())
	}
	rng.SetRounds(100)
	if rng.GetRounds() != 100 {
		t.Errorf("SetRounds() was called, but GetRounds() returned %d, but 100 was expected.", rng.GetRounds())
	}
	DeleteSalsa(rng)
}
