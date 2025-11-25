extends StaticBody2D

@export var lives_block = 1

@onready var sprite_node = get_node("Sprite")

func take_damage() -> bool:
	lives_block -= 1
	if lives_block == 0:
		queue_free()
		return true
	on_damage_receive()
	return false

func on_damage_receive():
	sprite_node.modulate = Color(0.75, 0.75, 0.75, 1)
