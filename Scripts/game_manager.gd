extends Node

var started := false
var lives := 3
var points := 0
var record := 0
var current_level := 1
var total_levels := 3

signal on_powerup

func reset_game():
	update_record()
	started = false
	lives = 3
	points = 0
	current_level = 1
	
func add_point(value):
	points += value

func update_record():
	if points > record:
		record = points

func change_level():
	if current_level < total_levels:
		current_level += 1
		var next_scene
		match current_level:
			1:
				next_scene = "res://Scenes/level_one.tscn"
			2:
				next_scene = "res://Scenes/level_two.tscn"
			3:
				next_scene = "res://Scenes/level_three.tscn"
			_:
				next_scene = "res://Scenes/level_one.tscn"
		get_tree().change_scene_to_file(next_scene)
	else:
		print("Jogo finalizado")
