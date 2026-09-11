extends Node

@onready var timer: Timer = $Timer
@onready var pipes: Node = $"../pipes"

@onready var pipe_scene = preload("res://scenes/pillers.tscn")

func spawn_pipe():
	var new_pipe = pipe_scene.instantiate()
	new_pipe.position = Vector2(900, randi_range(0,300))
	get_parent().get_node("pipes").add_child(new_pipe)


func _on_timer_timeout() -> void:
	spawn_pipe()
