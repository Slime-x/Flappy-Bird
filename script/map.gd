extends Area2D


@onready var spawner: Node = $"../../pipe_spawner"

var speed = 100
var spawning = false
func _process(delta: float) -> void:
	if not Gamemanager.game_over:
		position.x -= speed * delta
	if position.x < 0 and not spawning:
		spawning = true
		spawner.spawn_grass()
		
	if position.x < -1000:
		queue_free()
		spawning = false


func _on_body_entered(body: Node2D) -> void:
	Gamemanager.game_over = true
