extends Node2D

@onready var player = $player

func _ready() -> void:
	player.died.connect(_on_player_died)

func _on_player_died():
	print("gameover")
	get_tree().create_timer(3).timeout.connect(get_tree().reload_current_scene)
