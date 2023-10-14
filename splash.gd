extends Sprite2D

var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	timer = timer + (delta * 1)
	
	if timer >= 6:
		self_modulate = self_modulate.lerp(Color(1,1,1,0), delta * 1)
	elif timer >= 2:
		self_modulate = self_modulate.lerp(Color(0,0,0,0), delta * 1)
	else:
		self_modulate = self_modulate.lerp(Color(0,0,0,1), delta * 1)
	
	pass
