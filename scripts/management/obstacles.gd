extends StaticBody2D

onready var moi = get_parent().get_node("Moi")


var jump = false


func _physics_process(delta):
	if !jump:
		if get_position().x < moi.get_position().x:
			jump = true
			print("+ 10 pontos")
#			main.pontos += main.pontuacao_cacto 
#			main.get_node("Score"). text = "Score: " + str(main.pontos)
