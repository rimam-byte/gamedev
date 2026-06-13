extends Area2D
@export var speed: = 600.0
var direction: = Vector2.ZERO

func _physics_process(delta):
	position += direction * speed * delta
