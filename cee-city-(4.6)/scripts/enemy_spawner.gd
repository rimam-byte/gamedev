extends Node2D
@export var enemy_scene: PackedScene
@export var spawn_time := 2.0
@onready var timer = $Timer

func _ready() -> void:
	randomize()
	timer.wait_time = spawn_time
	timer.timeout.connect(spawn_enemy)
	timer.start()
func spawn_enemy():
	var enemy= enemy_scene.instantiate()
	
	#random positon
	var x = randi_range (0,1000)
	var y = randi_range(50,200)
	
	enemy.position = Vector2(x,y)
	
	get_tree().current_scene.add_child(enemy)
	
