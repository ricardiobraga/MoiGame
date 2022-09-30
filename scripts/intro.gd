extends CanvasLayer

export var path = ""


func _ready():
	$AnimationPlayer.play("FadeIn")
	yield(get_tree().create_timer(2), "timeout")
	$AnimatedSprite.play("idle")
	$AnimationPlayer.play("unholy")
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play("FadeOut")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene(path)
