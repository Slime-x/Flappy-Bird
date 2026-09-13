extends CanvasLayer

@onready var start: Control = $StartMenu
@onready var end: Control = $End_menu
@onready var points: Label = $"../Control/points"

func in_game():
	start.hide()
	Gamemanager.add_point()

func died():
	end.show()
	points.text = ""

func respawn():
	end.hide()
