extends Node2D

onready var floor_sprite = get_node("floor")
onready var timer = get_node("Timer")
onready var moi = get_node("Moi")

onready var camera = get_node("camera")


var player = preload("res://scenes/player/moi.tscn")

var text_timer = preload("res://scenes/management/label_timer.tscn") 

var velocity = 200
var start = false
var isTiming = false

var time = 0
var intervalo = 3
var interval_min = 0.8
var interval_max = 3

var floor_instances = [ preload("res://scenes/floor/floor.tscn") ]


onready var positition_start = get_node("FloorInstances").get_child(0).position.x





func _ready():
	
	var player_instance = player.instance()
	player_instance.set_position(Vector2(120,254.085))
	get_node(".").add_child(player_instance)		
	
	var textTimer = text_timer.instance()
	textTimer.set_position(Vector2(258,149))	
	get_node(".").add_child(textTimer)


func _physics_process(delta):
	if !start:
		return
	moveCamera(delta)
	spawn_floor(delta)
	pass	
		

func spawn_floor(_delta):
	var moi_position = get_node("Moi").position.x
	
	var child_count = get_node("FloorInstances").get_child_count()	
	
	print("Moi " , moi_position)
	
	if moi_position >= positition_start + 1900 and child_count < 3:			
		var random = RandomNumberGenerator.new()
		random.randomize()
		var c =  random.randi_range(0, floor_instances.size() -1)
		var floor_spawn = floor_instances[c].instance()
		var n = get_node("FloorInstances").get_child_count()
#		floor_spawn.set_position(Vector2(0,get_node("FloorInstances").get_child(0).get_position().y + 600))
		floor_spawn.set_position(Vector2(get_node("FloorInstances").get_child(n - 1).position.x + 1604 , 0))
		get_node("FloorInstances").add_child(floor_spawn)		
		get_node("FloorInstances").get_child(0).queue_free()
		positition_start = get_node("FloorInstances").get_child(1).position.x
		print("start " , positition_start)
		
		if  moi_position >= positition_start + 1800:			
			positition_start = get_node("FloorInstances").get_child(0).position.x
			
		
		
#	time += delta
#
#	if time >= intervalo:
#		time = 0 
#		var random = RandomNumberGenerator.new()
#		random.randomize()
#		var c =  random.randi_range(0, floor_instances.size() -1)
#		var floor_spawn = floor_instances[c].instance()
#		var n = get_node("FloorInstances").get_child_count()
##		floor_spawn.set_position(Vector2(0,get_node("FloorInstances").get_child(0).get_position().y + 600))
#		floor_spawn.set_position(Vector2(get_node("FloorInstances").get_child(n - 1).position.x + 1604 , 0))
#		get_node("FloorInstances").add_child(floor_spawn)
#
#		randomize()
#		intervalo = rand_range(interval_min, interval_max)	
		
func moveCamera(delta):
	camera.move_and_slide(Vector2(200 + delta, 0), Vector2())


func _on_start_timeout():
	start = true
#	textTimer.get_child(0).queue_free()
	timer.stop()
	
	pass # Replace with function body.
	
	
	
