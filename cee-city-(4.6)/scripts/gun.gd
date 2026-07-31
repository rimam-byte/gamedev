extends Node2D
@export var player: Node2D
@export var bullet_scene: PackedScene
@onready var marker_2d: Marker2D = $Marker2D

func _process(delta):
	if player == null:
		print('player not assigned')
		return
		
	global_position= player.global_position
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed('shoot'):
		shoot()
		

func shoot():
	if not get_tree().current_scene.use_ammo():
		return
	var bullet = bullet_scene.instantiate()
	bullet.global_position = marker_2d.global_position
	bullet.direction = (
		get_global_mouse_position() - bullet.global_position).normalized()
	bullet.rotation= bullet.direction.angle()
	get_tree().current_scene.add_child(bullet)
