extends Node2D

@onready var dark = $dark

var timer = 0
var exit_timer = 0
var entered = false
var exited = false
@onready var dialog = $PlayerAndUI2/CanvasLayer/DashColdown/Comp
# Called when the node enters the scene tree for the first time.

func _ready():
	entered = true

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GloabalTreker.tp == true:
		$PlayerAndUI2.position.x = 170
		$PlayerAndUI2.position.y = 690
		GloabalTreker.tp == false
		
	timer = timer + (delta * 1)
	
	if entered && timer >= 0.5:
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,0), delta * 10)
		
	elif exited:
		exit_timer = exit_timer + (delta * 1)
		dark.self_modulate = dark.self_modulate.lerp(Color(1,1,1,1), delta * 10)
		
		if exit_timer >= 0.35:
			GloabalTreker.tp = true;
			get_tree().change_scene_to_file("res://level_1.tscn")
	pass


func _on_perehod_body_entered(body):
	if body.name == "PlayerHuman":
		print("test")
		entered = false
		exited = true
func _on_perehod_2_body_entered(body):
	if body.name == "PlayerHuman":
		get_tree().change_scene_to_file("res://lev_3.tscn")

#Трогает комп
func _on_perehod_3_body_entered(body):
	dialog.stop()
	if body.name == "PlayerHuman":
		dialog.start("Computer")


func _on_perehod_3_body_exited(body):
	if body.name == "PlayerHuman":
		dialog.stop()

#Трогает Табличку
func _on_perehod_4_body_entered(body):
	if body.name == "PlayerHuman":
		dialog.start("Table")
	
		

