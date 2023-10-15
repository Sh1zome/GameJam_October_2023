extends Node2D
@onready var dialog = $PlayerAndUI/CanvasLayer/DashColdown/Tutorial/DialogueBox
func _ready():
	dialog.start("TUTOR")
func _process(delta):
	if GloabalTreker.tp == true:
		$PlayerAndUI.rect_posiont.x = 300
		GloabalTreker.tp = false
func _on_perehod_body_entered(body):
		if body.name == "PlayerHuman":
			print("Чё?")
			get_tree().change_scene_to_file("res://lev_2.tscn")
		
