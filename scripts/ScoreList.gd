extends Control

var undeline = preload("res://assets/font/undeline.tscn")

var arrayLetters = ["A","B", "C", "D", "E", "F", "G", "H", "I",
					"J", "K", "L", "M", "N", "O", "P", "Q", "R",
					"S", "T", "U", "V", "W", "X", "Y", "Z", "0",
					"1", "2", "3", "4", "5", "6", "7", "8", "9"]

var n = 0 
var n_position = 0
var end_array = 0

var is_new_record = false

var metadata = {"name": ""}


func _ready() -> void:	
	SilentWolf.configure({
		"api_key": "LKfINFybK69f4XKboKSss5EPRXeyLgMXanF536iF",
		"game_id": "MoiGame",
		"game_version": "1.0.0",
		"log_level": 0
	})
	
	
	if is_new_record:	
		instanceUndeline(get_node("PanelContainer/HBoxContainer/HBoxScores/Label1"))
	
		

func _physics_process(_delta):
	setLetter()	
	
func setLetter():
	
	if is_new_record:			
		
		var label1 = get_node("PanelContainer/HBoxContainer/HBoxScores/Label1")
		var label2 = get_node("PanelContainer/HBoxContainer/HBoxScores/Label2")
		var label3 = get_node("PanelContainer/HBoxContainer/HBoxScores/Label3")		
		var labels = [label1, label2, label3]		
			
		if  Input.is_action_just_pressed("ui_down") and n_position < 3 and n_position >=0 :
			if n == 35:
				n = -1
			n += 1			
			labels[n_position].text = str(arrayLetters[n])					
			
		if  Input.is_action_just_pressed("ui_up") and n_position < 3 and n_position >=0:
			if n == 0:
				n = 36
			n -= 1				
			labels[n_position].text = str(arrayLetters[n])				
			
		if Input.is_action_just_pressed("ui_select"):
			if n_position < 2:			
				labels[n_position].get_child(0).queue_free()
				n_position += 1	
				n = 0
				instanceUndeline(labels[n_position])
			if Input.is_action_just_pressed("ui_select") and n_position == 2:
				end_array += 1				
				if end_array >= 2:
					saveNewRecord(labels)
										
			
		if Input.is_action_just_pressed("ui_left") and n_position > 0 :
			if end_array >= 1:
				end_array -= 1
			labels[n_position].get_child(0).queue_free()
			n_position -= 1
			n = 0			
			instanceUndeline(labels[n_position])
			
		if Input.is_action_just_pressed("ui_right")and n_position <= 2:			
			if n_position < 2:			
				labels[n_position].get_child(0).queue_free()
				n_position += 1	
				n = 0
				instanceUndeline(labels[n_position])
				
			if Input.is_action_just_pressed("ui_right") and n_position == 1:
				end_array = 2				
				
#			
			
			
func saveNewRecord(array):	
	var player_name = ""
	for item in array:
		player_name += item.text
	
	var score_id = yield(SilentWolf.Scores.persist_score(player_name, Globals.score), "sw_score_posted")
	get_tree().change_scene("res://scenes/management/GameOver.tscn")
	Globals.score_cheked = false
	return
			
#	for item in Globals.hi_score:
#		if 	Globals.score > item.score :
#
#			Globals.hi_score.push_front({ "name": player_name, "score": int(get_node("PanelContainer/HBoxContainer/PlayerScore").text) }) 
#			Globals.hi_score.pop_back()
#			DataManagement.save_hi_score(Globals.hi_score)
#			get_tree().change_scene("res://scenes/management/GameOver.tscn")
#			Globals.score_cheked = false
#			return
	
	
func instanceUndeline(node):
	var l1 = node
	var underline_instance = undeline.instance()	
	underline_instance.set_global_position(Vector2(3.5, 16))	
	l1.add_child(underline_instance)
	
