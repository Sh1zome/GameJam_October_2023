extends Control


@onready var dialoge_box1 = $DialogueBox
@onready var buttonForMove = $"ButtonForMove/A&D"
@onready var jump = $ButtonForMove/W
@onready var dash = $ButtonForMove/Dash

func _ready():
	buttonForMove.visible = false
	jump.visible = false
	dash.visible = false
	

func _on_dialogue_box_dialogue_signal(value):
		if value == "buttons":
			print("detected!")
			buttonForMove.visible = true
		elif value == "disableButtons":
			buttonForMove.visible = false
		elif value == "showW":
			jump.visible = true
		elif value == "disableW":
			jump.visible = false
		elif value == "showDash":
			dash.visible = true
		elif value == "end":
			dash.visible = false
