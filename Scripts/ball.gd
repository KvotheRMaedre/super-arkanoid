extends CharacterBody2D

@export var y_speed := -250
@export var angle := [-250,250]
var started := false

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("start") and !started:
		play_game()
	move_and_collide(velocity * delta)

func play_game():
	started = true
	velocity = Vector2(angle.pick_random(), y_speed)
