extends StaticBody2D

@export var lives_block = 1

func take_damage() -> bool:
	lives_block -= 1
	if lives_block == 0:
		queue_free()
		return true
	return false
