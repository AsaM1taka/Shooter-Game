extends Label

var score = 0
const WIN_SCORE = 16

func _ready() -> void:
	text = "Happiness score: %d   " % score

func add_point():
	score += 1
	text = "Happiness score: %d   " % score

	if score >= WIN_SCORE:
		show_win_screen()

func show_win_screen():
	get_tree().change_scene_to_file("res://Scenes/win.tscn")
