extends Area2D

var moi

var jump = false

func _ready():
	moi = get_node("/root/Main/Moi")
func _physics_process(delta):
	move(delta)
	if !jump:
		if get_global_position().x < moi.get_global_position().x:
			jump = true
			Globals.score += 10 
			
func move(delta):
	var x_position = (get_position().x - 4 + delta)
	set_position(Vector2(x_position, 219))	

func _on_body_entered(body):	
	get_tree().change_scene("res://scenes/management/GameOver.tscn")