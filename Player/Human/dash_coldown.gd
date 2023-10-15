extends Control


@onready var InColdown = $CanvasLayer/InColdown
@onready var OutColdown = $CanvasLayer/OutColdown
@onready var Player = $"../../PlayerHuman"
@onready var dialog = $PlayerAndUI/CanvasLayer/DashColdown/Comp
var lvl

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
		GloabalTreker.openDoor = true
		lvl = SceneTree.current_scene
		lvl.get_node("./kamni").playing = true
		
		GloabalTreker.nahod +=1
	if value == "SSD":
		if GloabalTreker.ssd == false:
			pass
		if GloabalTreker.ssd == true:
			pass
			
	if value == "GoToScene4":
		get_tree().change_scene_to_file("res://lev_4.tscn")
		print("TEST")
	if value == "BackTo3":
		get_tree().change_scene_to_file("res://lev_3.tscn")
	if value == "GoTo5" && GloabalTreker.openDoor == true:
		get_tree().change_scene_to_file("res://lev_5.tscn")
