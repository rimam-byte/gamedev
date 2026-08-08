extends Control
func _on_back_pressed() -> void:
	if SceneManager.previous_scene == 'main_menu':
		get_tree().change_scene_to_file('res://scenes/mainmenu.tscn')
	elif SceneManager.previous_scene == 'pause':
		get_tree().change_scene_to_file('res://scenes/level.tscn')
	
