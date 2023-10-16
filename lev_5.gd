extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print($PlayerAndUI/PlayerHuman.global_position)
	if GloabalTreker.tp2 == true:
		$PlayerAndUI/PlayerHuman.global_position.x = 45
		GloabalTreker.tp2 = false


func _on_back_to_4_body_entered(body):
	if body.name == "PlayerHuman":
		GloabalTreker.tp3 = true
		get_tree().change_scene_to_file("res://lev_3.tscn")	
		





func _on_go_to_6_body_entered(body):
	if body.name == "PlayerHuman":
		get_tree().change_scene_to_file("res://lev_6.tscn")
