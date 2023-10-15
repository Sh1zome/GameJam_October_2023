extends Node2D

const GAME_SCENE_PATH : String = "res://level_1.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	ResourceLoader.load_threaded_request(GAME_SCENE_PATH)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_2_pressed():
	get_tree().quit()


func _on_button_pressed():
	get_tree().change_scene_to_file(GAME_SCENE_PATH)
	
