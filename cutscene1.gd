extends AnimatedSprite2D

@onready var dark = $"../dark"
@onready var rocket = $"../rocket"

# Called when the node enters the scene tree for the first time.
func _ready():
	play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_frame_progress() >= 0.9:
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,1), delta * 5)
	if get_frame_progress() <= 0.1:
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,0), delta * 5)
	if get_frame() == 7 && get_frame_progress() >= 0.95:
		print(get_frame())
		get_tree().change_scene_to_file("res://level_1.tscn")
	if get_frame() == 2:
		rocket.visible = true
		rocket.position = rocket.position.lerp(Vector2(773, 199), delta * 1)
		rocket.scale = rocket.scale.lerp(Vector2(0.093, 0.093), delta * 1)
	else:
		rocket.visible = false
		
	pass
