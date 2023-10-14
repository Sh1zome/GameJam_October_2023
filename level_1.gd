extends Node2D

@onready var health = $PlayerAndUI/PlayerHuman.health
@onready var health_bar = $PlayerAndUI/CanvasLayer/TextureProgressBar
@onready var max_health = $PlayerAndUI/PlayerHuman.max_health
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		health_bar.value = health
		health -= 3.5
		print(health)
		
func _ready():
	health_bar.max_value = max_health
	health_bar.value = health
	
	


func _on_perehod_body_entered(body):
		if body.name == "PlayerHuman":
			get_tree().change_scene_to_file("res://Виталя/level_2.tscn")
		
