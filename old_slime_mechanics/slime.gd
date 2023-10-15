extends Node2D

@export_node_path("SoftBody2D") var softBody2D_path = NodePath("./SoftBody2D")
@export_node_path("Sprite2D") var sprite2D_path = NodePath("./Face")
@export_node_path("StaticBody2D") var staticBody2D_path = NodePath("./pusher")
@export var speed = 400
var temp_velocity = 0
var to_left = false
var to_right = false

@onready var softBody2D = get_node(softBody2D_path)
@onready var sprite2D = get_node(sprite2D_path)
@onready var pusher = get_node(staticBody2D_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	pusher.get_node("./CollisionPolygon2D").disabled = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite2D.position.x = (softBody2D.get_node("./Bone-9").global_position.x - 320)
	sprite2D.position.y = (softBody2D.get_node("./Bone-9").global_position.y - 200)
	
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_right") && !to_left:
		velocity.x += 1
	if Input.is_action_pressed("ui_left") && !to_right:
		velocity.x -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	if velocity.x < 0 && !to_left:
		to_left = true
		pusher.get_node("./CollisionPolygon2D").position.x = pusher.get_node("./CollisionPolygon2D").position.x + 100
	
	if velocity.x > 0 && !to_right:
		to_right = true
		pusher.get_node("./CollisionPolygon2D").position.x = pusher.get_node("./CollisionPolygon2D").position.x - 100
	
	if !to_left && !to_right:
		pusher.get_node("./CollisionPolygon2D").position.x = (softBody2D.get_node("./Bone-9").global_position.x - 320)
	
	if to_left == true:
		if velocity == Vector2.ZERO:
			pusher.get_node("./CollisionPolygon2D").disabled = true
			to_left = false
		else:
			pusher.get_node("./CollisionPolygon2D").disabled = false
			pusher.get_node("./CollisionPolygon2D").position = pusher.get_node("./CollisionPolygon2D").position.lerp(Vector2((softBody2D.get_node("./Bone-9").global_position.x - 320), 0), delta * 1)
	
	if to_right == true:
		if velocity == Vector2.ZERO:
			pusher.get_node("./CollisionPolygon2D").disabled = true
			to_right = false
		else:
			pusher.get_node("./CollisionPolygon2D").disabled = false
			pusher.get_node("./CollisionPolygon2D").position = pusher.get_node("./CollisionPolygon2D").position.lerp(Vector2((softBody2D.get_node("./Bone-9").global_position.x - 320), 0), delta * 1)
	
	pusher.get_node("./CollisionPolygon2D").position.y = (softBody2D.get_node("./Bone-9").global_position.y - 215)
	
	
	pass
