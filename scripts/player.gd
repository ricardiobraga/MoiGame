extends KinematicBody2D

onready var sprite = get_node("Sprite")
onready var animation = get_node("AnimatedSprite")
onready var player = get_node(".")

onready var collision_run = get_node("CollisionRun")
onready var collision_squat = get_node("CollisionSquat")

onready var main_script = get_node("/root/Main")

var velocity = Vector2(200, 600)

var fall_speed = 190

var jump_count = 0
var modificar_gravidade = 3

export(int) var jump_speed 



func _physics_process(delta):
	if !main_script.start:
		return
		
	move(delta)
	velocity.y +=  fall_speed * delta
	velocity = move_and_slide(Vector2(0,velocity.y), Vector2.UP)
	jump(delta)	
	squat()


func move(delta):
	$AnimatedSprite.play()
	player.move_and_slide(Vector2(Globals.velocity + delta, 0), Vector2())		


func jump(delta):
	if is_on_floor():
		jump_count = 0
	
	if Input.is_action_pressed("ui_select"):
		velocity.y += fall_speed * delta
	else:
		velocity.y += fall_speed  * delta * modificar_gravidade	
	if Input.is_action_just_pressed("ui_select") and jump_count < 2:		
		velocity.y = jump_speed
		jump_count += 1
		
		
func squat():
	if Input.is_action_pressed("ui_down"):
		collision_run.disabled = true
		collision_squat.disabled = false
		animation.play("squat")
	if Input.is_action_just_released("ui_down"):
		collision_run.disabled = false
		collision_squat.disabled = true
		animation.play("run")


	



