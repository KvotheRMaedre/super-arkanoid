extends CharacterBody2D

var fall_speed := 80
var rotation_spped := 60

func _physics_process(delta: float) -> void:
	velocity.y = fall_speed
	rotation_degrees += rotation_spped * delta
	
	move_and_slide()
