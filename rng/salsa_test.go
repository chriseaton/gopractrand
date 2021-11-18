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

func TestSalsaRaw32(t *testing.T) {
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
	seed := uint(554)
	rng.SeedAndIV(&seed, false)
	DeleteSalsa(rng)
}

func TestSalsaRounds(t *testing.T) {
	rng := NewSalsa()
	if rng.Get_rounds() != 20 {
		t.Errorf("Get_rounds() returned %d, but 20 was expected.", rng.Get_rounds())
	}
	rng.Set_rounds(100)
	if rng.Get_rounds() != 100 {
		t.Errorf("Set_rounds() was called, but Get_rounds() returned %d, but 100 was expected.", rng.Get_rounds())
	}
	DeleteSalsa(rng)
}
