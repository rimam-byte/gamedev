extends Control
func _on_resume_pressed() -> void:
	get_tree().paused = false
func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/level.tscn')
func _on_options_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/options.tscn')
func _on_exit_pressed() -> void:
	get_tree().quit()
