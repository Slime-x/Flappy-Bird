extends Node




var game_over = false
var resetting = false

var point = 0
var highScore = 0

func _process(_delta):
	if game_over and not resetting:
		resetting = true
		await get_tree().create_timer(1).timeout
		game_over = false
		gamereset()
		resetting = false
		
func gamereset():
	var bird = get_tree().current_scene.get_node("bird")
	var pipes = get_tree().current_scene.get_node("pipes")
	bird.position = bird.start_position
	bird.velocity.y = 0
	if point > highScore:
		highScore = point
	point = 0
	print("HIGH SCORE:" + str(highScore))
	for pillers in pipes.get_children():
		pillers.queue_free()
	
	
