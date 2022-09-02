extends Control


var score_element = preload("res://scenes/management/ScoreList.tscn")
var score_new_record = preload("res://scenes/management/NewRecord.tscn")

onready var local_score = get_node("Score")

var score_rank = 1

func _ready():	
	loadScoreList()	
	
	

	
func saveNewRecord(new_record):	
	DataManagement.score_list.sort_custom(self, "ordenateScore")	
	for item in DataManagement.score_list:
		if new_record.score > item.score:
			item.name = new_record.name
			item.score = new_record.score		
		return	
	
	
func loadScoreList():
	Globals.hi_score.sort_custom(Globals, "ordenateScore")
	
	for item in Globals.hi_score:
		if score_rank > 5:
			return
		
			
			
		var player_score = score_element.instance()
		player_score.get_node("HBoxContainer/RankPosition").text  =  str(score_rank)		
		player_score.get_node("HBoxContainer/PlayerName").text = item.name
		player_score.get_node("HBoxContainer/PlayerScore").text =str(item.score) 
		get_node("ScoreList").add_child(player_score)		
			
		score_rank += 1
		
	if !Globals.score_cheked:
		get_node("Menu").visible = true
				

func _on_quit_pressed():
	get_tree().quit()


func _on_Jogar_novamente_pressed():	
	Globals.score = 0	
	Globals.velocity = 200
	Globals.render_new_score = false
	Globals.score_cheked = false
	get_tree().change_scene("res://scenes/main.tscn")	


func on_voltar_menu_pressed():
	Globals.score = 0	
	Globals.velocity = 200
	Globals.render_new_score = false
	Globals.score_cheked = false
	get_tree().change_scene("res://scenes/management/MenuInicial.tscn")
