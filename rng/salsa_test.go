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
	if rng.Raw32() != 2225711153 {
		t.Errorf("Seed(uint64) should have produced an expected value.")
	}
	seed := uint(554)
	rng.SeedAndIV(&seed, false)
	if rng.Raw32() != 251969256 {
		t.Errorf("Seed(uint, bool) should have produced an expected value.")
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
