extends Area2D

@export var speed := 300.0
var direction:= Vector2.ZERO

func _process(delta):
	position +- direction * speed * delta
	if global_position.x < -700 or global_position.x >700 or global_position.y<-400 or global_position.y>400:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('bullet'):
		body.queue_free()
		queue_free()
