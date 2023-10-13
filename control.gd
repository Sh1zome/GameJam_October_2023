extends Control

@onready var dialoge_box = $DialogueBox
@onready var particles = $CPUParticles2D

func _ready():
	dialoge_box.start("START")
	print($DialogueBox.variables)
