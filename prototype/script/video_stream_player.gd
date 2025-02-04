extends VideoStreamPlayer

func _ready():
	play()  # Start the video

func _on_VideoStreamPlayer_finished():
	get_tree().change_scene_to_file("res://prototype/scene/game_over_final.tscn")
