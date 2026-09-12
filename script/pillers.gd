extends Node2D





var speed = 100

func _process(delta: float) -> void:
	if not Gamemanager.game_over:
		position.x -= speed * delta
	if position.x < -100:
		queue_free()
	

func _on_body_entered(_body):
	Gamemanager.game_over = true


func _on_area_2d_body_entered(_body):
	Gamemanager.point += 1
	Gamemanager.add_point()
	$Coin.play()
	
	
