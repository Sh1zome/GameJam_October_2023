extends Control
@export var scene:String = "res://level_1.tscn"
@onready var logo:Sprite2D = get_node("./Max")
var progress = []
var scene_load_status = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	ResourceLoader.load_threaded_request(scene)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scene_load_status = ResourceLoader.load_threaded_get_status(scene,progress)
	logo.material.set_shader_param("percentage", progress[0])
	pass
