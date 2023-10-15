extends CharacterBody2D


const SPEED = 150
const JUMP_VELOCITY = -300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $AnimatedSprite2D
@onready var health_bar = $"../CanvasLayer/ProgressBar"
var clickStat = 2
var DashRight = false
var DashColdown = false
var DashColdownVisual = 3.5

signal DashCd (new_DashCd)
func _physics_process(delta):
	#health_bar.value = GloabalTreker.health 
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite.play("Jump")
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			sprite.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			sprite.play("Idle")
	if direction ==-1:
		sprite.flip_h = true
	elif direction == 1:
		sprite.flip_h = false
	if velocity.y >0:
		sprite.play("Fall")
	if Input.is_action_just_pressed("Right"):
		
		if DashColdown == false:
			clickStat -= 1
			if clickStat <= 0:
				velocity.x =+ 1500
				velocity.y -= 200
				DashColdown = true
				DashColdownVisual = 3.5
	if Input.is_action_just_pressed("Left"):
		if DashColdown == false:
			clickStat -= 1
			if clickStat <= 0:
				velocity.x -= 1500
				velocity.y -= 200
				DashColdown = true
				DashColdownVisual = 3.5
	if Input.is_action_just_pressed("ui_down"):
		pass 
		#GloabalTreker.health -= 10
	move_and_slide()
func _on_dash_track_timeout():
	clickStat = 2
	if DashColdownVisual != 0:
		DashColdownVisual -= 0.5
	
	
func _on_dash_coldown_timeout():
	if DashColdown == true:
		DashColdown = false

	
		



