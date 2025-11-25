extends Node

var started := false
var lives := 3
var points := 0
var record := 0

signal on_powerup

func reset_game():
	update_record()
	started = false
	lives = 3
	points = 0
	
func add_point(value):
	points += value

func update_record():
	if points > record:
		record = points
