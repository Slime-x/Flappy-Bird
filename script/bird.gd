extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0
var start_position = Vector2(200,300)

func _physics_process(delta: float) -> void:
	if Gamemanager.start_menu:
		return
	if not is_on_floor():
		velocity += get_gravity() * delta

	if not Gamemanager.game_over:
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			$Jump.play()
	if velocity.y < 0:
				rotation_degrees = -10
	if velocity.y > 0:
		rotation_degrees = 10

	move_and_slide()
