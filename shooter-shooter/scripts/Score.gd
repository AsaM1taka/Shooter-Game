extends Label

var score = 0
const winscore = 16

func _ready() -> void:
	text = "Happiness score: {score}"

func add_point():
	score += 1
	text = "Happiness score: {score}"

	if score >= winscore:
		show_win_screen()

func show_win_screen():
	get_tree().change_scene_to_file("res://Scenes/win.tscn")
