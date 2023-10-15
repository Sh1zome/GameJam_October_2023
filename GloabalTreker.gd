extends Node

var tp = false
var complete1 = false
var health = 100
var PlayerSpeed = 150
var nahod = 0
#SaveList
var ssd = true

func _ready():
	print(GloabalTreker.health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if nahod == 1:
		print("PlayCatScene")
		nahod == 5
	if health <= 0:
		$"res://Player/Human/player_and_ui.tscn".queue_free()
		
