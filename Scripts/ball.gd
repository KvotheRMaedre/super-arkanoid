extends CharacterBody2D

@export var y_speed := -250
@export var angle := [-250,250]
@export var drop_probability := 0.2
@export var item_scene := preload("res://Scenes/power_up_item.tscn")

@onready var item_power_up_timer: Timer = $ItemPowerUpTimer

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("start") and !GameManager.started:
		play_game()
		
	if GameManager.started:
		var collison = move_and_collide(velocity * delta)
		if collison != null:
			velocity = velocity.bounce(collison.get_normal())
			
			var collided_object = collison.get_collider()
			if "Block" in collided_object.name:
				collided_object.queue_free()
				spawm_power_up(collided_object.get_position())
	
func play_game():
	GameManager.started = true
	velocity = Vector2(angle.pick_random(), y_speed)
	
func spawm_power_up(position : Vector2):
	if randf() < drop_probability and item_power_up_timer.is_stopped():
		var item = item_scene.instantiate()
		item.position = position
		get_parent().add_child(item)
		item_power_up_timer.start()
	
func reset_position():
	var player = get_parent().get_node("Player")
	position = Vector2(player.position.x, player.position.y - 25)
	GameManager.started = false
	
