extends Parallax2D

var speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not Gamemanager.game_over:
		position.x -= speed * delta
	if position.x < -700:
		queue_free()
		print("removed")
	
