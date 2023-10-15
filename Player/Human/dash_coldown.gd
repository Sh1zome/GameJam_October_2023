extends Control


@onready var InColdown = $CanvasLayer/InColdown
@onready var OutColdown = $CanvasLayer/OutColdown
@onready var Player = $"../../PlayerHuman"
@onready var dialog = $PlayerAndUI2/CanvasLayer/DashColdown/Comp
func _ready():
	InColdown.visible = false
	OutColdown.visible = true

func _process(delta):
	if Player.DashColdown == true:
		InColdown.play("Animate");
		OutColdown.visible = false
		InColdown.visible = true
	elif Player.DashColdown == false:
		InColdown.visible = false
		OutColdown.visible = true
		


func _on_comp_dialogue_signal(value):
	if value == "nahod+":
		print("PlayShake")
		GloabalTreker.nahod +=1
	if value == "SSD":
		if GloabalTreker.ssd == false:
			pass
		if GloabalTreker.ssd == true:
			pass
			
	if value == "GoToScene4":
		get_tree().change_scene_to_file("res://lev_4.tscn")
	if value == "BackTo3":
		get_tree().change_scene_to_file("res://lev_3.tscn")
