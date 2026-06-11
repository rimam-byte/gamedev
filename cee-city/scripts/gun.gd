extends Node2D
@onready var marker_2d: Marker2D = $Marker2D
const Bullet = preload('res://assets/bullet.png')

func _process(delts:float) -> void:
	look_at(get_global_mouse_position())

func shoot() -> void:
	var new_bullet = Bullet.instantiate()
	new_bullet.position= marker_2d.global_position
	new_bullet.target_position = (get_global_mouse_position()- marker_2d.global_position).normalized()
	level.world.add_child()
