extends ParallaxBackground

onready var parallax_floor = get_node("ParallaxBackground/ParallaxLayer")

var parallax_offset = 0
var layer_speeed: int = 19.2
var velocidade = Vector2(200,500)

func _ready():
	
	pass

func _physics_process(delta: float):
#	paralax_layer.motion_offset.x -= layer_speeed * delta
	parallax_offset -= velocidade.x * delta
	set_scroll_offset(Vector2(parallax_offset, 0))
	

