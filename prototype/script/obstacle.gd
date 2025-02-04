extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		call_deferred("reload_scene")

func reload_scene():
	get_tree().reload_current_scene()
