extends Area2D



var moi

var jump = false

func _ready():
	moi = get_node("/root/Main/Moi")
func _physics_process(delta):
	if !jump:
		if get_global_position().x < moi.get_global_position().x:
			jump = true
			Globals.score += 10    
			print("moi: ", moi.get_global_position().x, " Obstacle ", get_global_position().x)
			print("+ 10 pontos")
#			main.pontos += main.pontuacao_cacto 
#			main.get_node("Score"). text = "Score: " + str(main.pontos)


func _on_body_entered(body):
#	moi.set_collision_mask_bit( 1, false )
	if Globals.score > Globals.hi_score:
		Globals.hi_score = Globals.score
#		DataManagement.save_hi_score()
	
#	Globals.score = 0
#	get_node("/root/Main").start = false
	get_tree().change_scene("res://scenes/management/GameOver.tscn")
		
	
	
	print("Morreu")
	
