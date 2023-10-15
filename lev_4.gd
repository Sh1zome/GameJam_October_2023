extends Node2D

@onready var dialog = $PlayerAndUI/CanvasLayer/DashColdown/Comp
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
		GloabalTreker.tp = true;
		get_tree().change_scene_to_file("res://lev_3.tscn")


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
