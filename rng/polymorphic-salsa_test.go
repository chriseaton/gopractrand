package rng

import (
	"testing"
)

func TestNewPolymorphicSalsaFromAuto(t *testing.T) {
	rng := NewPolymorphicSalsaFromAuto(GetSEED_AUTO())
	if rng == nil {
		t.Error("Instance should not be nil")
	}
	DeletePolymorphicSalsa(rng)
}
