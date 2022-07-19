extends Node

const SAVE_FILE_PATH = "user://save.dat"



var score_list = [ 
	{
		"name": "RIC",
		"score": 10
	}, 
	{
		"name": "TAM",
		"score": 20
	},
	{
		"name": "Olga",
		"score": 0
	},
		{
		"name": "TAM",
		"score": 0
	},
		{
		"name": "TER",
		"score": 50
	},
		
]

func _ready():	
	score_list.sort_custom(self, "ordenateScore")	
	#	print("score: ", score.sort())

func ordenateScore(a, b):
	if a.score > b.score:		
		return true	
	return false
		


func save_hi_score(score_array):	
	var save_data = File.new()
	save_data.open(SAVE_FILE_PATH, File.WRITE)
	save_data.store_var(score_array)
	save_data.close()    
	
func load_hi_score():
	var save_data = File.new()
	
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH, File.READ)
		Globals.hi_score = save_data.get_var()
		save_data.close()
