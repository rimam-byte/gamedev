extends Control
signal back_to_pause_requested

func _on_back_pressed() -> void:
	if SceneManager.previous_scene == 'main_menu':
		get_tree().change_scene_to_file('res://scenes/mainmenu.tscn')
	else:
		back_to_pause_requested.emit()
	
