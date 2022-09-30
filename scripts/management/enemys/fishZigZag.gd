extends Area2D

var moi

export(int) var speed = 4

var y_position
var y_pos
var up_y = true	
export(float) var y_speed = 80

var jump = false

func _ready():
	moi = get_node("/root/Main/Moi")
	y_position = get_position().y
	
func _physics_process(delta):
	move(delta)
	
	if !jump:
		if get_global_position().x < moi.get_global_position().x:
			jump = true
			Globals.score += 10 
			
func move(delta):
	var x_position = (get_position().x - speed + delta)
	y_variation(delta)	
	set_position(Vector2(x_position, y_pos))	
	
func y_variation(delta):	

	if up_y:			
		if get_position().y == y_position or get_position().y > y_position - y_speed:
			y_pos = get_position().y - y_speed * delta				
			return y_pos			
	
	if get_position().y < y_position - 10:
		up_y = false
		y_pos = get_position().y + y_speed * delta	
		return y_pos
	
	if get_position().y < y_position:
		up_y = true
		

		

func _on_body_entered(body):
	
	DeathSound.play()
#	SceneChanger.change_scene("res://scenes/management/GameOver.tscn")	
	get_tree().change_scene("res://scenes/management/GameOver.tscn")
