extends Node




var game_over = false
var resetting = false
var point = 0
var highScore = 0
var start_menu = true
var in_game = false
var game_over_menu = false
var game_over_menu_ = false

func _input(jump):
	var UI = get_tree().current_scene.get_node("UI")
	if Input.is_action_just_pressed("jump"):
		start_menu = false
		UI.in_game()
		in_game = true
	if game_over and resetting:
		if game_over_menu_:
			await get_tree().create_timer(2).timeout
			game_over_menu_ = false
			if Input.is_action_just_pressed("jump"):
				game_over = false
				UI.respawn()
				gamereset()
				print("dyaum")
				resetting = false
		
func _process(_delta):
	
	if game_over and not resetting:
		var UI = get_tree().current_scene.get_node("UI")
		var hurt = get_tree().current_scene.get_node("Hurt")
		resetting = true
		#hurt.play()
		UI.died()
		game_over_menu_ = true
		
		
		
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
