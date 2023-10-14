extends Node2D

@onready var health = $PlayerHuman.health
@onready var health_bar = $CanvasLayer/TextureProgressBar
@onready var max_health = $PlayerHuman.max_health
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		health_bar.value = health
		health -= 3.5
		print(health)
		
func _ready():
	health_bar.max_value = max_health
	health_bar.value = health
	
