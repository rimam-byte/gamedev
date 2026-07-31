extends Area2D
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.climb = true

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.climb= false
		body.climbing = false
