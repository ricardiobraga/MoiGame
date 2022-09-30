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

var hard_on = false

var floor_instances_base = [ 
						preload("res://scenes/floor/floor_easy_01.tscn"),
						preload("res://scenes/floor/floor_easy_02.tscn"),
						preload("res://scenes/floor/floor_easy_03.tscn"),
						preload("res://scenes/floor/floor_easy_04.tscn"),
						preload("res://scenes/floor/floor_easy_05.tscn"),
						preload("res://scenes/floor/floor_easy_06.tscn"),
						preload("res://scenes/floor/floor_easy_07.tscn"),												
					  ]

var floor_instances = [ 
						preload("res://scenes/floor/floor_easy_01.tscn"),
						preload("res://scenes/floor/floor_easy_02.tscn"),
						preload("res://scenes/floor/floor_easy_03.tscn"),
						preload("res://scenes/floor/floor_easy_04.tscn"),
						preload("res://scenes/floor/floor_easy_05.tscn"),
						preload("res://scenes/floor/floor_easy_06.tscn"),
						preload("res://scenes/floor/floor_easy_07.tscn"),												
					  ]
					
					
					
var floor_instances_hard = [
						preload("res://scenes/floor/floor_hard_01.tscn"),
						preload("res://scenes/floor/floor_hard_02.tscn"),
						preload("res://scenes/floor/floor_hard_03.tscn"),
						preload("res://scenes/floor/floor_hard_04.tscn"),
						preload("res://scenes/floor/floor_hard_07.tscn"),
						preload("res://scenes/floor/floor_hard_06.tscn"),
						preload("res://scenes/floor/floor_hard_07.tscn"),
]

onready var positition_start = get_node("FloorInstances").get_child(0).global_position.x


func _ready():
	floor_instances = floor_instances_base
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
		Globals.velocity += 5
		time = 0
			
	spawn_floor(delta)
	score_control()
	level_control()
	
		

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
	
func level_control():
	if Globals.score >= 10:	
		if hard_on:
			return
			
		if !hard_on:
			floor_instances += floor_instances_hard			
			hard_on = true
	

func _on_start_timeout():
	start = true
	timer.stop()
	
	
	
	
func score_control():
	get_node("CanvasLayer/Score").text = "Score: " + str(Globals.score) 
	

	



