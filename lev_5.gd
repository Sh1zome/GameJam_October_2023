extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#GloabalTreker.openDoor = true
	#GloabalTreker.tp = true
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_to_4_body_entered(body):
	if body.name == "PlayerHuman":
		get_tree().change_scene_to_file("res://lev_3.tscn")
		



