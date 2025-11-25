extends "res://Scripts/level_one.gd"

@onready var audio_level_up: AudioStreamPlayer2D = $AudioLevelUp

func _ready() -> void:
	audio_level_up.play()
