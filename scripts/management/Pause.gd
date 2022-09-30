extends CanvasLayer


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_node("/root/Main/CanvasLayer/Panel").visible = !get_node("/root/Main/CanvasLayer/Panel").visible
		if get_node("/root/Main/CanvasLayer/Panel").visible:
			get_node("/root/Main/CanvasLayer/Panel/VBoxContainer/Voltar").grab_focus()
		get_tree().paused = !get_tree().paused
