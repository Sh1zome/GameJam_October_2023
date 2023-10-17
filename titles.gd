extends Sprite2D

var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer = timer + (delta * 1)
	if timer >= 3:
		position = position.lerp(Vector2(0, -3382), delta * 0.015)
	pass
