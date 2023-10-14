extends Control


@onready var dialoge_box1 = $Tutorial
@onready var buttonForMove = $"ButtonsForMove/A&D"
@onready var jump = $ButtonsForMove/W
@onready var dash = $ButtonsForMove/Dash

func _ready():
	buttonForMove.visible = false
	jump.visible = false
	dash.visible = false
	
	#Вызывать в нужном месте
	dialoge_box1.start("TUTOR")

func _on_tutorial_dialogue_signal(value):
		print(value)
		if value == "buttons":
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
