extends Panel





func _on_voltar_pressed():
	get_tree().paused = false
	$".".visible = false	


func _on_menuInicial_pressed():
	get_tree().paused = false
	SceneChanger.change_scene("res://scenes/management/MenuInicial.tscn")


func _on_quit_pressed():
	get_tree().quit()
