extends Area2D
@export var speed: = 600.0
var direction: = Vector2.ZERO

func _physics_process(delta):
	position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('enemies'):
		body.queue_free()
		get_tree().current_scene.add_score(1)
		queue_free()
