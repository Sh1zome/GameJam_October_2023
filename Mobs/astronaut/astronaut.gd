extends CharacterBody2D


@onready var sprt = $AnimatedSprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Переименовываем переменную is_moving_right в is_moving
var is_moving = true
const speed = 10

func move_left():
	velocity.x = -speed
	print(velocity.x)
	# Проверяем, движется ли персонаж вправо
	if velocity.x > 0:
		# Останавливаем движение вправо
		velocity.x = 0

func move_right():
	velocity.x = speed

func _physics_process(_delta):
	if is_moving:
		move_right()
		sprt.flip_h = false
	else:
		move_left()
		sprt.flip_h = true

	move_and_slide()

# Изменяем функцию _on_timer_timeout()
func _on_timer_timeout():
	# Переключаем значение переменной is_moving
	is_moving = not is_moving

	# Вызываем функцию move_left()
	move_left()

