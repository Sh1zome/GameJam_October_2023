extends Node

var tp = false
var complete1 = false
var health = 100
var PlayerSpeed = 150
func _ready():
	print(GloabalTreker.health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		$"res://Player/Human/player_and_ui.tscn".queue_free()
		
