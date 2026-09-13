extends CanvasLayer

@onready var start: Control = $StartMenu
@onready var end: Control = $End_menu

func in_game():
	start.hide()
	Gamemanager.add_point()

func died():
	end.show()
	
func respawn():
	end.hide()
