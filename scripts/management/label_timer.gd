extends Control



onready var time_count = get_node("Timer")


	
func _physics_process(delta):
	get_node("Label").text = str(int(time_count.time_left))

func _on_Timer_timeout():
	get_node("/root/Main").start = true
	queue_free()
	pass # Replace with function body.
