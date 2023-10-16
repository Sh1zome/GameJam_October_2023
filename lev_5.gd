extends Node2D

@onready var dark = $dark

var timer = 0
var exit_timer = 0
var entered = false
var exited = false
var lvl3 = false
var lvl6 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	entered = true
	#GloabalTreker.openDoor = true
	#GloabalTreker.tp = true
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print($PlayerAndUI/PlayerHuman.global_position)
	if GloabalTreker.tp2 == true:
		$PlayerAndUI/PlayerHuman.global_position.x = 45
		GloabalTreker.tp2 = false
	
		
	timer = timer + (delta * 1)
	
	if entered && timer >= 0.5:
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,0), delta * 10)
		
	if exited:
		exit_timer = exit_timer + (delta * 1)
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,1), delta * 10)
		
	if exit_timer >= 0.35:
		if lvl3:
			GloabalTreker.tp3 = true
			get_tree().change_scene_to_file("res://lev_3.tscn")
		if lvl6:
			GloabalTreker.tp = true;
			get_tree().change_scene_to_file("res://lev_6.tscn")
	pass


func _on_back_to_4_body_entered(body):
	if body.name == "PlayerHuman":
		exited = true
		lvl3 = true
		





func _on_go_to_6_body_entered(body):
	if body.name == "PlayerHuman":
		exited = true
		lvl6 = true
