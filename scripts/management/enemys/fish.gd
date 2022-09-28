extends Area2D

var moi

export(int) var speed = 2
export(int) var pontos = 10

var y_position
var y_pos
var up_y = true	

var jump = false

func _ready():
	moi = get_node("/root/Main/Moi")
	y_position = get_position().y
	
func _physics_process(delta):
	move(delta)
	
	if !jump:
		if get_global_position().x < moi.get_global_position().x:
			jump = true
			Globals.score += pontos
			
func move(delta):
	var x_position = (get_position().x - speed + delta)
	set_position(Vector2(x_position, get_position().y))	

func _on_body_entered(body):	
	get_tree().change_scene("res://scenes/management/GameOver.tscn")
