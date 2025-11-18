extends CharacterBody2D

@export var speed := 400

@onready var spawn_shot: Timer = $SpawnShot
var bullet_scene := preload("res://Scenes/bullet.tscn")
var max_bullet := 20
var current_bullet := 0

func _ready() -> void:
	GameManager.on_powerup.connect(spawn_bullet)

func _physics_process(delta: float) -> void:
	velocity.x = 0
	if GameManager.started:
		if Input.is_action_pressed("left"):
			velocity.x -= speed
		if Input.is_action_pressed("right"):
			velocity.x += speed
		
	move_and_collide(velocity * delta)

func spawn_bullet():
	var left_shoot_instance = bullet_scene.instantiate()
	get_parent().add_child(left_shoot_instance)
	left_shoot_instance.global_position.x = global_position.x - 35
	
	var right_shoot_instance = bullet_scene.instantiate()
	get_parent().add_child(right_shoot_instance)
	right_shoot_instance.global_position.x = global_position.x + 35
	
	current_bullet += 2
	
	if current_bullet < max_bullet:
		spawn_shot.start()
	else:
		spawn_shot.stop()
		current_bullet = 0

func _on_spawn_shot_timeout() -> void:
	spawn_bullet()
