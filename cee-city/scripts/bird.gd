extends Area2D

@export var speed := 100.0
var direction:= Vector2.ZERO


func _process(delta):
	position += direction * speed * delta
	if global_position.x < -700 or global_position.x >700 or global_position.y<-400 or global_position.y>400:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('bullet'):
		area.queue_free()
		queue_free()
