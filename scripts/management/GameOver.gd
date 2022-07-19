extends Control

var score_input = preload("res://scenes/prefabs/score_input_name.tscn")
var score_element = preload("res://scenes/prefabs/menu/ScoreList.tscn")
var score_new_record = preload("res://scenes/prefabs/menu/NewRecord.tscn")

onready var local_score = get_node("Score")



var score_rank = 1


var new_record = {"name" : "Olga", "score" : 60 }



func _ready():
#	saveNewRecord(new_record)
	
	loadScoreList()	
	pass
	
	

	
	
func saveNewRecord(new_record):	
	DataManagement.score_list.sort_custom(self, "ordenateScore")	
	for item in DataManagement.score_list:
		if new_record.score > item.score:
			item.name = new_record.name
			item.score = new_record.score		
		return	
	
	
func loadScoreList():
	for item in DataManagement.score_list:
		if score_rank > 5:
			return
		
		if Globals.score > item.score and Globals.render_new_score == false:
			local_score.text = "Você estabeleceu um novo record"			
			var player_score = score_new_record.instance()
			player_score.is_new_record = true
			player_score.get_node("PanelContainer/HBoxContainer/RankPosition").text  =  str(score_rank)			
			player_score.get_node("PanelContainer/HBoxContainer/PlayerScore").text =str(Globals.score) 
			get_node("ScoreList").add_child(player_score)			
			Globals.render_new_score = true
			score_rank += 1
				
			
		var player_score = score_element.instance()
		player_score.get_node("HBoxContainer/RankPosition").text  =  str(score_rank)		
		player_score.get_node("HBoxContainer/PlayerName").text = item.name
		player_score.get_node("HBoxContainer/PlayerScore").text =str(item.score) 
		get_node("ScoreList").add_child(player_score)
		
		
			
		score_rank += 1
		
		
		
		

		

func _on_quit_pressed():
	get_tree().quit()


func _on_Jogar_novamente_pressed():
	Globals.score = 0
	Globals.render_new_score = false
	get_tree().change_scene("res://scenes/main.tscn")
