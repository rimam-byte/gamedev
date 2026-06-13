extends Node2D
@export var bullet_scene: PackedScene
@onready var marker_2d: Marker2D = $Marker2D

func _process(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed('shoot'):
		shoot()
		

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = $Marker2D.global_position
	bullet.direction = (
		get_global_mouse_position() - bullet.global_position).normalized()
	get_tree().current_scene.add_child(bullet)
