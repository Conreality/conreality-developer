/* This is free and unencumbered software released into the public domain. */

// Package developer
package developer

import (
	"fmt"
)

// Version
func Version() string {
	return fmt.Sprintf("%s", "0.0.0") // TODO
}

// State
type State struct{}

// NewState
func NewState() *State {
	return &State{}
}

// ExecString
func (state *State) ExecString(code string) error {
	return nil // TODO
}

// ExecFile
func (state *State) ExecFile(path string) error {
	return nil // TODO
}
