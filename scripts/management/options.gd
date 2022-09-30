extends Control

var reset_score = [
	{
		"name": "AAA",
		"score": 0
	},
	{
		"name": "AAA",
		"score": 0
	},	
	{
		"name": "AAA",
		"score": 0
	},
	{
		"name": "AAA",
		"score": 0
	},
	{
		"name": "AAA",
		"score": 0
	},
]

func _ready():
	get_node("VBoxContainer/Reset").grab_focus()



func _on_reset_pressed() -> void:
	DataManagement.save_hi_score(reset_score)
	Globals.hi_score = reset_score
	SceneChanger.change_scene("res://scenes/management/ScoreScreen.tscn")
#	var change = get_tree().change_scene("res://scenes/management/ScoreScreen.tscn")
	return


func _on_Voltar_pressed():
	SceneChanger.change_scene("res://scenes/management/MenuInicial.tscn")
#	var change = get_tree().change_scene("res://scenes/management/MenuInicial.tscn")
