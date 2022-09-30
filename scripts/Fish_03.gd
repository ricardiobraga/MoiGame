extends Area2D

var moi

export(int) var speed = 2

var jump = false


onready var collision_up = get_node("CollisionShapeUp")
onready var collision_down = get_node("CollisionShapeDown")

func _ready():
	moi = get_node("/root/Main/Moi")
	
	set_fish_side()

	
func _physics_process(delta):
	move(delta)
	
	if !jump:
		if get_global_position().x < moi.get_global_position().x:
			jump = true
			Globals.score += 10 
			
func move(delta):
	var x_position = (get_position().x - speed + delta)
	set_position(Vector2(x_position, get_position().y))	

func _on_body_entered(body):	
	DeathSound.play()
			
#	SceneChanger.change_scene("res://scenes/management/GameOver.tscn")
	get_tree().change_scene("res://scenes/management/GameOver.tscn")	

	
func set_fish_side():
	var random = RandomNumberGenerator.new()
	random.randomize()
	var n =  random.randi_range(1, 2)	
	
	if n == 1:
		$AnimatedSprite.play("Up")	
		set_position(Vector2(get_position().x, 330))
		collision_down.set_deferred("disabled", true)
#
		
	if n == 2:
		$AnimatedSprite.play("Down")
		collision_up.set_deferred("disabled", true)


