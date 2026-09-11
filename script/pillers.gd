extends Node2D

var speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not Gamemanager.game_over:
		position.x -= speed * delta
	



func _on_body_entered(body: Node2D) -> void:
	Gamemanager.game_over = true
