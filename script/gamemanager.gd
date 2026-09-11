extends Node




var game_over = false

func _process(delta: float) -> void:
	if game_over:
		await get_tree().create_timer(2).timeout
		gamereset()
		
func gamereset():
	var bird = get_tree().current_scene.get_node("bird")
	bird.position = bird.start_position
	game_over = false
