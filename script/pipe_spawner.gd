extends Node

@onready var timer: Timer = $Timer
@onready var pipes: Node = $"../pipes"

@onready var pipe_scene = preload("res://scenes/pillers.tscn")
@onready var grass = preload("res://scenes/map.tscn")

func spawn_pipe():
	var new_pipe = pipe_scene.instantiate()
	new_pipe.position = Vector2(700,randi_range(-150,70))
	get_parent().get_node("pipes").add_child(new_pipe)

func spawn_grass():
	var map = grass.instantiate()
	map.position = Vector2(989, 0)
	get_parent().get_node("map").add_child(map)


func _on_timer_timeout() -> void:
	if Gamemanager.start_menu:
		return
	spawn_pipe()
