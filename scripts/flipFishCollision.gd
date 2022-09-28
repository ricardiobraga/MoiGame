extends Area2D

onready var collision_up = get_node("../CollisionShapeUp")
onready var collision_down = get_node("../CollisionShapeDown")

func _on_Area2D_body_entered(body):
	var random = RandomNumberGenerator.new()
	random.randomize()
	var n =  random.randi_range(1, 2)
	
	
	if n == 1:
		
		get_node("../AnimatedSprite").play("Up")
#		$AnimatedSprite.play("Up")	
		collision_up.disabled = false	
		collision_down.disabled = true
		print("Up: ",collision_up)
		print("Down: ", collision_down)
		
	if n == 2:
		pass
#		$AnimatedSprite.play("Down")
#		collision_up.disabled = true
#		collision_down.disabled = false
#		print("Up: ",collision_up.disabled)
#		print("Down: ", collision_down.disabled)
