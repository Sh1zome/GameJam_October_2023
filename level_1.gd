extends Node2D
@onready var dialog = $PlayerAndUI/CanvasLayer/DashColdown/Tutorial/DialogueBox
func _ready():
	dialog.start("TUTOR")

func _on_perehod_body_entered(body):
		if body.name == "PlayerHuman":
			print("Чё?")
			get_tree().change_scene_to_file("res://Виталя/level_2.tscn")
		
