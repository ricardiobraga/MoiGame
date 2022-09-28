extends Area2D


var explosion = preload("res://scenes/prefabs/collectExplosion.tscn")

var array_cores = ["vermelho", "roxo", "verde"]

export(int) var bonus = 10

func _ready():
	 random_color()
	

func _on_Area2D_body_entered(body):
		Globals.score += bonus
		var explosion_instance = explosion.instance()		
		explosion_instance.set_position(Vector2(get_position().x, get_position().y))
		get_node("../").add_child(explosion_instance)
		print(get_node("../"))
		explosion_instance.emitting = true
		
		
		queue_free()
		
func random_color():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var n =  random.randi_range(0, array_cores.size() -1)
	$AnimatedSprite.play(array_cores[n])
	
