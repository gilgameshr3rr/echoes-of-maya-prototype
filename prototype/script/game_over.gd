extends Control

func _on_button_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://prototype/scene/level.tscn")
		
func _on_button_quit_pressed() -> void:
	get_tree().quit()
