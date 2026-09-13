extends Node




var game_over = false
var resetting = false
var point = 0
var highScore = 0
var start_menu = true
var in_game = false
var game_over_menu = false
var can_restart = false

func _input(_jump):
	var UI = get_tree().current_scene.get_node("UI")
	if Input.is_action_just_pressed("jump"):
		start_menu = false
		in_game = true
		UI.in_game()
		in_game = true
		
	if game_over and can_restart and Input.is_action_just_pressed("jump"):
			game_over = false
			resetting = false
			can_restart = false
			UI.respawn()
			gamereset()


func _process(_delta):
	if game_over and not resetting:
		var UI = get_tree().current_scene.get_node("UI")
		var hurt = get_tree().current_scene.get_node("Hurt")
		resetting = true
		hurt.play()
		UI.died()
		UI.game_point.text = str(point)
		if point > highScore:
			highScore = point
			UI.highscore.text = "High score: " + str(point)
		await get_tree().create_timer(1).timeout
		can_restart = true


func gamereset():
	var bird = get_tree().current_scene.get_node("bird")
	var pipes = get_tree().current_scene.get_node("pipes")
	var UI = get_tree().current_scene.get_node("UI")
	bird.position = bird.start_position
	bird.velocity.y = 0
	point = 0
	add_point()
	for pillers in pipes.get_children():
		pillers.queue_free()
	
func add_point():
	var points = get_tree().current_scene.get_node("Control/points")
	points.text = str(point)
