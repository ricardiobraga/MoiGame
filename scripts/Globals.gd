extends Node


var score = 0
var hi_score = []
var render_new_score = false
var score_cheked = false

var velocity = 200

func _ready():	
	print("teste")
	DataManagement.load_hi_score()
	hi_score.sort_custom(self, "ordenateScore")	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	


func ordenateScore(a, b):
	if a.score > b.score:		
		return true	
	return false







	
