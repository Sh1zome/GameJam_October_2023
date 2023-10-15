extends Node2D
@onready var dialog = $PlayerAndUI/CanvasLayer/DashColdown/Tutorial/DialogueBox
@onready var dark = $dark

var timer = 0
var exit_timer = 0
var entered = false
var exited = false

func _ready():
	entered = true
	if GloabalTreker.complete1 == false:
		dialog.start("TUTOR")
		GloabalTreker.complete1 = true
	
func _process(delta):
	if GloabalTreker.tp == true:
		$PlayerAndUI.position.x = 375
		$PlayerAndUI.position.y = 660
		GloabalTreker.tp = false
	timer = timer + (delta * 1)
	if entered && timer >= 0.35:
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,0), delta * 2)
	elif exited:
		exit_timer = exit_timer + (delta * 1)
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,1), delta * 8)
		if exit_timer >= 0.35:
			get_tree().change_scene_to_file("res://lev_2.tscn")
func _on_perehod_body_entered(body):
	if body.name == "PlayerHuman":
		entered = false
		exited = true
		
