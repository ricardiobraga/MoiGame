extends Node2D

onready var timer = get_node("Timer")
onready var camera = get_node("camera")

var player = preload("res://scenes/prefabs/player/moi.tscn")
var text_timer = preload("res://scenes/management/label_timer.tscn") 

var velocity = 200
var start = false
var isTiming = false

var time = 0
var intervalo = 3
var interval_min = 0.8
var interval_max = 3

var floor_instances = [ 
						preload("res://scenes/floor/floor_easy_02.tscn"),						
						
												
					  ]

onready var positition_start = get_node("FloorInstances").get_child(0).global_position.x


func _ready():
	
	var player_instance = player.instance()
	player_instance.set_position(Vector2(78,323))
	get_node(".").add_child(player_instance)		
	
	var textTimer = text_timer.instance()
	textTimer.set_position(Vector2(319,147))	
	get_node(".").add_child(textTimer)




func _physics_process(delta):
	if !start:
		return
	moveCamera(delta)
	
	
	time += delta
	
	if int(time)  == 10:
		Globals.velocity += 20
		time = 0
		
	
	spawn_floor(delta)
	score_control()
	
		

func spawn_floor(_delta):
	var moi_position = get_node("Moi").global_position.x
	
	var child_count = get_node("FloorInstances").get_child_count()		
	
	if moi_position >= positition_start + 1000 and child_count < 3:			
		var random = RandomNumberGenerator.new()
		random.randomize()
		var c =  random.randi_range(0, floor_instances.size() -1)
		var floor_spawn = floor_instances[c].instance()
		var n = get_node("FloorInstances").get_child_count()
#		floor_spawn.set_position(Vector2(0,get_node("FloorInstances").get_child(0).get_position().y + 600))
		floor_spawn.set_position(Vector2(get_node("FloorInstances").get_child(n - 1).global_position.x + 810 , -64))
		get_node("FloorInstances").add_child(floor_spawn)		
		get_node("FloorInstances").get_child(0).queue_free()
		positition_start = get_node("FloorInstances").get_child(1).position.x
		
		
		if  moi_position >= positition_start + 990:			
			positition_start = get_node("FloorInstances").get_child(0).position.x
					
func moveCamera(delta):
	camera.move_and_slide(Vector2(Globals.velocity + delta, 0), Vector2()).normalized()

func _on_start_timeout():
	start = true
	timer.stop()
	
	
	
	
func score_control():
	get_node("CanvasLayer/Score").text = "Score: " + str(Globals.score) 
	
	



