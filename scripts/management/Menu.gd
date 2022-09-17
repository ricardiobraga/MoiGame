extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"




# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("VBoxContainer/Start").grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_start_pressed():
	var change = get_tree().change_scene("res://scenes/main.tscn")


func _on_score_pressed():
	
	var change = get_tree().change_scene("res://scenes/management/ScoreScreen.tscn")


func _on_quit_pressed():
	var change = get_tree().quit()
	


func _on_options_pressed():
	var change = get_tree().change_scene("res://scenes/management/options.tscn")
