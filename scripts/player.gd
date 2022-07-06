extends KinematicBody2D

onready var sprite = get_node("Sprite")
onready var player = get_node(".")

var velocity = Vector2(200, 300)

var fall_speed = 200

var jump_count = 0
var modificar_gravidade = 3

export(int) var jump_speed 

onready var main_script = get_node("/root/Main")




func _ready():
	pass


func _physics_process(delta):
	if main_script.start == false:
		return
		
	move(delta)
	velocity.y +=  fall_speed * delta
	velocity = move_and_slide(Vector2(0,velocity.y), Vector2.UP)
	jump(delta)
	
	

	


func move(delta):
	player.move_and_slide(Vector2(200 + delta, 0), Vector2())
		
#	if Input.is_action_pressed("ui_right"):
#		player.move_and_slide(Vector2(200 + delta, 0), Vector2())
#
#	if Input.is_action_pressed("ui_left"):
#		player.move_and_slide(Vector2(-200 - delta, 0), Vector2())

func jump(delta):
	if is_on_floor():
		jump_count = 0
	
	if Input.is_action_pressed("ui_select"):
		velocity.y += fall_speed  * delta
	else:
		velocity.y += fall_speed  * delta * modificar_gravidade	
	if Input.is_action_just_pressed("ui_select") and jump_count < 2:
		print("pula")
		velocity.y = jump_speed
		jump_count += 1
	 

func spawn_floor():
	var moi_x = get_node(".").get_position().x
	
	



