extends Node2D
@onready var marker_2d: Marker2D = $Marker2D

func _process(delts:float) -> void:
	look_at(get_global_mouse_position())
