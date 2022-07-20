extends Control



func _on_reset_pressed() -> void:
	DataManagement.save_hi_score(DataManagement.reset_score)
