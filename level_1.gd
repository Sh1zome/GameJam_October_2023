extends Node2D

func _on_perehod_body_entered(body):
		if body.name == "PlayerHuman":
			get_tree().change_scene_to_file("res://Виталя/level_2.tscn")
		
