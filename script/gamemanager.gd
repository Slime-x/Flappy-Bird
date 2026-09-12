extends Node




var game_over = false
var resetting = false
var point = 0
var highScore = 0

func _process(_delta):
	if game_over and not resetting:
		var hurt = get_tree().current_scene.get_node("Hurt")
		resetting = true
		hurt.play()
		await get_tree().create_timer(2).timeout
		game_over = false
		gamereset()
		resetting = false
		
func gamereset():
	var bird = get_tree().current_scene.get_node("bird")
	var pipes = get_tree().current_scene.get_node("pipes")
	var hs = get_tree().current_scene.get_node("Control/highscore")
	bird.position = bird.start_position
	bird.velocity.y = 0
	if point > highScore:
		highScore = point
		hs.text = "High score: " + str(point)
	point = 0
	add_point()
	for pillers in pipes.get_children():
		pillers.queue_free()
	
func add_point():
	var points = get_tree().current_scene.get_node("Control/points")
	points.text = str(point)
