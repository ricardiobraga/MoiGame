extends ParallaxLayer

export(float) var speed = 5

func _process(delta):
	self.motion_offset.x += speed * delta

