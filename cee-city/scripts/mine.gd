extends Area2D
@export var fall_speed := 250.0

func _process(delta: float) -> void:
	position.y += fall_speed * delta

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group('enemies'):
		return
	if body.is_in_group('player'):
		get_tree().current_scene.take_damage()
		queue_free()
