extends Label

var score = 0

func _ready() -> void:
	text = "Score: %d" % score

func add_point():
	score += 1
	text = "Score: %d" % score
