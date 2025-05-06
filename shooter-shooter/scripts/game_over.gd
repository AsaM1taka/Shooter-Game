extends CanvasLayer


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/shoot er.tscn")
 

func _on_quit_pressed() -> void:
	get_tree().quit()
