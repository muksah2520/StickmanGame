extends CharacterBody2D
class_name Base_character
var speed = 150
var jump_speed = -700
var gravity = 4000
var direction = 1

@export var move_left_action := ""
@export var move_right_action := ""
@export var jump_action := ""
@export var shoot_action := ""
#@export var Bullet=PackedScene
var Bullet= preload("res://scenes/bullet.tscn")



	
	
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	var desired_dirn = Input.get_axis(move_left_action,move_right_action)
	if desired_dirn == 0:
		$AnimatedSprite2D.play("idle")
		
	velocity.x = desired_dirn * speed
	if Input.is_action_just_pressed(jump_action)  and is_on_floor():
		velocity.y=jump_speed
	if Input.is_action_just_pressed(move_left_action) and direction == 1:
		scale.x = -1
		direction = -1
		$AnimatedSprite2D.play("player_running")
	elif Input.is_action_just_pressed(move_right_action) and direction == -1:
		scale.x = -1
		direction = 1
		$AnimatedSprite2D.play("player_running")
	move_and_slide()
	if Input.is_action_just_pressed(shoot_action):
		shoot()
	
func shoot():
	var b=Bullet.instantiate()
	owner.add_child(b)
	b.global_position = get_node("bullet_spawn").global_position
	b.global_rotation = get_node("bullet_spawn").global_rotation
	
