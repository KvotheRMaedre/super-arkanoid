extends CharacterBody2D

@export var y_speed := -250
@export var angle := [-250,250]

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("start") and !GameManager.started:
		play_game()

	if GameManager.started:
		var collison = move_and_collide(velocity * delta)
		if collison != null:
			velocity = velocity.bounce(collison.get_normal())

func play_game():
	GameManager.started = true
	velocity = Vector2(angle.pick_random(), y_speed)
