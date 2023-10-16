extends Node

var tp = false
var tp2 = false
var complete1 = false
var health = 100
var PlayerSpeed = 150
var nahod = 0
var openDoor = false
var artifact = false
var ssd = true
var playCamni = true
var tp3 = false
var goToLvl5 = false
var BackToLvl3 = false
var goToLvl4 = false

func _ready():
	print(GloabalTreker.health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if health <= 0:
		$"res://Player/Human/player_and_ui.tscn".queue_free()
	
		
		
