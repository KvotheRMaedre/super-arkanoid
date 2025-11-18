extends CharacterBody2D

var fall_speed := 80
var rotation_spped := 60

func _physics_process(delta: float) -> void:
	velocity.y = fall_speed
	rotation_degrees += rotation_spped * delta
	
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		var collision_object = collision.get_collider()
		if collision_object.name == "Player":
			GameManager.on_powerup.emit()
			queue_free()
