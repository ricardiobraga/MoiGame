extends Area2D


var explosion = preload("res://scenes/prefabs/collectExplosion.tscn")


	

func _on_Area2D_body_entered(body):
		Globals.score += 23
		var explosion_instance = explosion.instance()		
		explosion_instance.set_position(Vector2(get_position().x, get_position().y))
		get_node("../").add_child(explosion_instance)
		print(get_node("../"))
		explosion_instance.emitting = true
		
		
		queue_free()
	
