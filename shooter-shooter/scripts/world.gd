extends Node2D

@onready var player = $player
@onready var mainCamera = $MainCamera

func _ready() -> void:
	player.died.connect(_on_player_died)
	player.camera_remote_transform.remote_path = mainCamera.get_path()

func _on_player_died():
	print("gameover")
	get_tree().create_timer(3).timeout.connect(get_tree().reload_current_scene)
