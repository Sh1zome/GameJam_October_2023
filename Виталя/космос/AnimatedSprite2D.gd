extends AnimatedSprite2D

@onready var sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play("Planets")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	pass
