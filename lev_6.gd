extends Node2D

@onready var dark = $dark

var timer = 0
var exit_timer = 0
var entered = false
var exited = false

# Called when the node enters the scene tree for the first time.
func _ready():
	entered = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer = timer + (delta * 1)

	
	if entered && timer >= 0.5:
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,0), delta * 10)
		
	if exited:
		exit_timer = exit_timer + (delta * 1)
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,1), delta * 10)
		

		if exit_timer >= 0.35:
			GloabalTreker.tp2 = true
			get_tree().change_scene_to_file("res://lev_5.tscn")
	pass


func _on_area_2d_body_entered(body):
	if body.name == "PlayerHuman":
		exited = true
