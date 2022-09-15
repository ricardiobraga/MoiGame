extends AnimatedSprite


func _physics_process(delta):
	move(delta)

func move(delta):
	var x_position = (get_global_position().x - 2 + delta)
	set_position(Vector2(x_position, 220))	
