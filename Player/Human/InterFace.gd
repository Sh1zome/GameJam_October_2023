extends Control


@onready var InColdown = $CanvasLayer/InColdown
@onready var OutColdown = $CanvasLayer/OutColdown
@onready var Player = $"../../PlayerHuman"

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
		
