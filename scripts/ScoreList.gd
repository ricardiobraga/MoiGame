extends Control



#var score_position = get_global_position()	



var arrayLetters = ["A","B", "C", "D", "E", "F", "G", "H", "I",
					"J", "K", "L", "M", "N", "O", "P", "Q", "R",
					"S", "T", "U", "V", "W", "X", "Y", "Z", "0",
					"1", "2", "3", "4", "5", "6", "7", "8", "9"]

var n = 0 
var n_position = 0

var is_new_record = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
#	score_position = get_global_position()
	pass


func _physics_process(delta):
#	setLetter(get_node("/root/Control").is_new_record)
	setLetter(delta)
	pass
	
func setLetter(delta):
	if is_new_record:		
		
		var label1 = get_node("PanelContainer/HBoxContainer/HBoxScores/Label1")
		var label2 = get_node("PanelContainer/HBoxContainer/HBoxScores/Label2")
		var label3 = get_node("PanelContainer/HBoxContainer/HBoxScores/Label3")
		
		var labels = [label1, label2, label3]		
	
			
		if  Input.is_action_just_pressed("ui_down") and n < 35:
			n += 1			
			labels[n_position].text = str(arrayLetters[n])


		if  Input.is_action_just_pressed("ui_up") and n > 0:
			n -= 1				
			labels[n_position].text = str(arrayLetters[n])			
			
			
		if Input.is_action_just_pressed("ui_select"):
			n = 0
			n_position += 1
		
	




