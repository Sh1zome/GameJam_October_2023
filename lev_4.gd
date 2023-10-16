extends Node2D
@onready var dialog = $PlayerAndUI/CanvasLayer/DashColdown/Comp
var tryaska = false
var timer = 0
@onready var dark = $dark

var timerD = 0
var exit_timer = 0
var entered = false
var exited = false
# Called when the node enters the scene tree for the first time.
func _ready():
	entered = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GloabalTreker.nahod == 1 && GloabalTreker.playCamni == true:
		$kamni.play()
		tryaska = true
		GloabalTreker.playCamni = false
	if tryaska:
		timer = timer + (delta * 1)
		if timer <= 3:
			$"Основа".get_material().set_shader_parameter("Strength", 1)
			$"Потолок".get_material().set_shader_parameter("Strength", 1)
			$"КОЛОННЫ".get_material().set_shader_parameter("Strength", 1)
			$"декор П".get_material().set_shader_parameter("Strength", 1)
			$"Декор".get_material().set_shader_parameter("Strength", 1)
		else:
			$"Основа".get_material().set_shader_parameter("Strength", 0)
			$"Потолок".get_material().set_shader_parameter("Strength", 0)
			$"КОЛОННЫ".get_material().set_shader_parameter("Strength", 0)
			$"декор П".get_material().set_shader_parameter("Strength", 0)
			$"Декор".get_material().set_shader_parameter("Strength", 0)
	
	timerD = timerD + (delta * 1)
	if entered && timerD >= 0.5:
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,0), delta * 10)
		
	elif exited:
		exit_timer = exit_timer + (delta * 1)
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,1), delta * 10)
		
	if exit_timer >= 0.35:
		if GloabalTreker.BackToLvl3:
			GloabalTreker.tp = true;
			get_tree().change_scene_to_file("res://lev_3.tscn")
			
#Коробка 1
func _on_box_1_body_entered(body):
	if body.name == "PlayerHuman":
		dialog.start("Box1")

#Серверная
func _on_box_2_body_entered(body):
	if body.name == "PlayerHuman":
		dialog.start("Box2")

#Коробка 3
func _on_box_3_body_entered(body):
	pass # Replace with function body.

#Возвращение
func _on_backto_3_body_entered(body):
	if body.name == "PlayerHuman":
		dialog.start("BackTo3")
		GloabalTreker.tp = true;
		
	
func _on_box_1_body_exited(body):
	if body.name == "PlayerHuman":
		dialog.stop()


func _on_box_2_body_exited(body):
	if body.name == "PlayerHuman":
		dialog.stop()


func _on_box_3_body_exited(body):
	if body.name == "PlayerHuman":
		dialog.stop()


func _on_backto_3_body_exited(body):
	if body.name == "PlayerHuman":
		dialog.stop()
