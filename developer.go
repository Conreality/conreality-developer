/* This is free and unencumbered software released into the public domain. */

// Package developer
package developer

import (
	"fmt"

	"github.com/conreality/conreality-gdk/gdk"
	"github.com/conreality/conreality-gdk/rt"
)

// Version
func Version() string {
	return fmt.Sprintf("%s", gdk.Version)
}

// State
type State struct {
	model  *rt.Model
	thread *rt.Thread
}

// NewState
func NewState() *State {
	state := &State{}
	state.model = &rt.Model{
		Self:    &Agent{},
		Unit:    &Unit{},
		Theater: &Theater{},
		Game:    &Game{},
		Headset: nil, // see SetHeadset
	}
	return state
}

// SetHeadset
func (state *State) SetHeadset(headset Headset) {
	state.model.Headset = headset
}

// Start
func (state *State) Start() error {
	thread, err := rt.NewThread(state.model, false)
	if err != nil {
		return err
	}
	state.thread = thread
	return nil
}

// Destroy
func (state *State) Destroy() {
	if state.thread != nil {
		state.thread.Destroy()
		state.thread = nil
	}
	state.model = nil
}

// ExecChunk
func (state *State) ExecChunk(chunk []byte) error {
	return state.thread.EvalChunk(chunk)
}

// ExecString
func (state *State) ExecString(code string) error {
	return state.thread.EvalScript(code)
}

// ExecFile
func (state *State) ExecFile(path string) error {
	return state.thread.EvalFile(path)
}

// Headset
type Headset interface {
	Speak(message string)
}

// Agent
type Agent struct{}

// IsPlayer
func (agent *Agent) IsPlayer() bool {
	return false // TODO
}

// IsRobot
func (agent *Agent) IsRobot() bool {
	return false // TODO
}

// CanFly
func (agent *Agent) CanFly() bool {
	return false // TODO
}

// CanMove
func (agent *Agent) CanMove() bool {
	return false // TODO
}

// HasLegs
func (agent *Agent) HasLegs() bool {
	return false // TODO
}

// HasWings
func (agent *Agent) HasWings() bool {
	return false // TODO
}

// HasWheels
func (agent *Agent) HasWheels() bool {
	return false // TODO
}

// Name
func (agent *Agent) Name() string {
	return "Unknown" // TODO
}

// Game
type Game struct{}

// IsPaused
func (game *Game) IsPaused() bool {
	return false // TODO
}

// IsPrivate
func (game *Game) IsPrivate() bool {
	return false // TODO
}

// IsPublic
func (game *Game) IsPublic() bool {
	return !game.IsPrivate()
}

// IsStarted
func (game *Game) IsStarted() bool {
	return false // TODO
}

// IsStopped
func (game *Game) IsStopped() bool {
	return false // TODO
}

// Theater
type Theater struct{}

// Unit
type Unit struct{}

// IsAlive
func (unit *Unit) IsAlive() bool {
	return true // TODO
}

// IsDead
func (unit *Unit) IsDead() bool {
	return !unit.IsAlive()
}
