extends Node


var health = 100
func _ready():
	
	print(GloabalTreker.health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		$"res://Player/Human/player_and_ui.tscn".queue_free()
		
