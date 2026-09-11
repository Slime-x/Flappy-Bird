extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0
var start_position = Vector2(200,300)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if not Gamemanager.game_over:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY

	move_and_slide()
