extends CharacterBody2D


const SPEED = 0
var chase = false

@onready var slime_animated = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var player = $"../PlayerHuman"
func _physics_process(delta):
	
	var direction = (player.position - self.position).normalized()
	if chase == true:
		slime_animated.play("targeting")
	else:
		slime_animated.play("idle")
	if direction.x < 0:
		slime_animated.flip_h = false
	else:
		slime_animated.play("targeting")
		slime_animated.flip_h = true



func _on_detect_body_entered(body):
	if body.name == "PlayerHuman":
		chase = true



func _on_detect_body_exited(body):
	if body.name == "PlayerHuman":
		chase = false
