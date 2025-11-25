extends Node2D

@onready var timer_reset: Timer = $TimerReset

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("next_level_test"):
		GameManager.change_level()

func _on_death_zone_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		if GameManager.lives > 1:
			GameManager.lives -= 1
			body.reset_position()
		else:
			timer_reset.start()
	else:
		body.queue_free()

func _on_timer_reset_timeout() -> void:
	GameManager.reset_game()
	get_tree().change_scene_to_file("res://Scenes/level_one.tscn")
