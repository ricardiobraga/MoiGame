extends Area2D

var moi

var jump = false

func _ready():
	moi = get_node("/root/Main/Moi")
	
	
	
func _physics_process(_delta):
	alga_interaction()	
			
func alga_interaction():
	
	if !jump and moi:
		if get_global_position().x < moi.get_global_position().x:
			jump = true
			Globals.score += 10 
	


func _on_body_entered(_body):	
	get_tree().change_scene("res://scenes/management/GameOver.tscn")
	
