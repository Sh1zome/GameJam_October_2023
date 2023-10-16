extends Node2D

@onready var dark = $dark

var timer = 0
var exit_timer = 0
var entered = false
var exited = false
var lvl2 = false
var lvl5 = false

@onready var dialog = $PlayerAndUI/CanvasLayer/DashColdown/Comp
# Called when the node enters the scene tree for the first time.
func _ready():
	entered = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GloabalTreker.tp3 == true:
		$PlayerAndUI/PlayerHuman.global_position.x = 45
		GloabalTreker.tp3 = false
		
		
	timer = timer + (delta * 1)
	
	if entered && timer >= 0.5:
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,0), delta * 10)
		
	elif exited:
		exit_timer = exit_timer + (delta * 1)
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,1), delta * 10)
		
		if exit_timer >= 0.35:
			if lvl2:
				get_tree().change_scene_to_file("res://lev_2.tscn")
			if lvl5:
				get_tree().change_scene_to_file("res://lev_5.tscn")
			if GloabalTreker.goToLvl5:
				get_tree().change_scene_to_file("res://lev_5.tscn")
				

func _on_perehod_body_entered(body):
	if body.name == "PlayerHuman":
		entered = false
		exited = true
		lvl2 = true
		GloabalTreker.tp = true


func _on_perehod_2_body_entered(body):
	if body.name == "PlayerHuman":
		dialog.stop()
		dialog.start("RightDoor")


func _on_perehod_2_body_exited(body):
	if body.name == "PlayerHuman":
		dialog.stop()


func _on_door_active_body_entered(body):
	if body.name == "PlayerHuman":
		dialog.stop()
		dialog.start("MiddleDoor")


func _on_door_active_body_exited(body):
	if body.name == "PlayerHuman":
		dialog.stop()


func _on_door_active_2_body_entered(body):
	if body.name == "PlayerHuman":
		dialog.stop()
		dialog.start("ByAuthor")


func _on_go_to_5_body_entered(body):
	if body.name == "PlayerHuman":
		entered = false
		exited = true
		lvl5 = true

#Космонавт
func _on_area_2d_body_entered(body):
	if body.name == "PlayerHuman":
		dialog.stop()
		if GloabalTreker.artic == false:
			dialog.start("Cosmonavt0")
		else:
			dialog.start("Cosmonavt1")
