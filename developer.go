/* This is free and unencumbered software released into the public domain. */

// Package developer
package developer

import (
	"fmt"
)

// State
type State struct{}

// NewState
func NewState() *State {
	return &State{}
}

// Version
func Version() string {
	return fmt.Sprintf("%s", "0.0.0")
}
