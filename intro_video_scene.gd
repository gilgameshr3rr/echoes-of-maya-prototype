extends VideoStreamPlayer

func _ready():
	play()
	  # Inicia a reprodução do vídeo automaticamente


func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://prototype/scene/level.tscn")
