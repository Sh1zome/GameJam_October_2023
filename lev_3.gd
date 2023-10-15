extends Node2D

@onready var dark = $dark

var timer = 0
var exit_timer = 0
var entered = false
var exited = false

@onready var dialog = $PlayerAndUI/CanvasLayer/DashColdown/Comp
# Called when the node enters the scene tree for the first time.
func _ready():
	entered = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer = timer + (delta * 1)
	
	if entered && timer >= 0.5:
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,0), delta * 10)
		
	elif exited:
		exit_timer = exit_timer + (delta * 1)
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,1), delta * 10)
		
		if exit_timer >= 0.35:
			get_tree().change_scene_to_file("res://lev_2.tscn")


func _on_perehod_body_entered(body):
	if body.name == "PlayerHuman":
		entered = false
		exited = true
		GloabalTreker.tp = true


func _on_perehod_2_body_entered(body):
	if body.name == "PlayerHuman":
		dialog.start("RightDoor")


func _on_perehod_2_body_exited(body):
	if body.name == "PlayerHuman":
		dialog.stop()


func _on_door_active_body_entered(body):
	if body.name == "PlayerHuman":
		dialog.start("MiddleDoor")
