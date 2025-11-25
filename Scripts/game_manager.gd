extends Node

var started := false
var lives := 3

signal on_powerup

func reset_game():
	started = false
	lives = 3
