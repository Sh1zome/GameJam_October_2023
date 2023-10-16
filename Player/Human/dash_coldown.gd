extends Control


@onready var InColdown = $CanvasLayer/InColdown
@onready var OutColdown = $CanvasLayer/OutColdown
@onready var Player = $"../../PlayerHuman"
@onready var dialog = $Comp



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
		GloabalTreker.nahod +=1
		GloabalTreker.playCamni = true
		print("ppp")
	if value == "ssd":
		GloabalTreker.openDoor = true
	
		
	if value == "GoToScene4":
		GloabalTreker.goToLvl4 = true
		get_tree().change_scene_to_file("res://lev_4.tscn")
		print("TEST")
	if value == "BackTo3":
		GloabalTreker.BackToLvl3 = true
		get_tree().change_scene_to_file("res://lev_3.tscn")
	if value == "GoTo5" && GloabalTreker.openDoor == true:
		GloabalTreker.goToLvl5 = true
		get_tree().change_scene_to_file("res://lev_5.tscn")
	if value == "GetArtifact":
		GloabalTreker.artic = true
	if value == "end":
		dialog.stop()
		get_tree().change_scene_to_file("res://titles.tscn")
		
		
