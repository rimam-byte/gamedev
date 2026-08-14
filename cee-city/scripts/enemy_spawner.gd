extends Node2D
@export var enemy_scene: PackedScene
@export var spawn_time := 2.0
@export var bird_scene: PackedScene
@export var bird_spawn_time := 5.0

@onready var timer = $Timer
@onready var bird_timer = $BirdTimer

func _ready() -> void:
	randomize()
	timer.wait_time = spawn_time
	timer.timeout.connect(spawn_enemy)
	timer.start()
	
	bird_timer.wait_time = bird_spawn_time
	bird_timer.timeout.connect(spawn_bird)
	bird_timer.start()
	
	
func spawn_enemy():
	var enemy= enemy_scene.instantiate()
	enemy.speed= get_tree().current_scene.current_drone_speed
	#random positon
	var x = randi_range (0,1000)
	var y = randi_range(50,200)
	enemy.position = Vector2(x,y)
	get_tree().current_scene.add_child(enemy)
	
func spawn_bird():
	var bird = bird_scene.instantiate() 
	var from_left = randf() < 0.5
	var spawn_y = randf_range(100, 200)
	
	if from_left:
		bird.position = Vector2(-300, spawn_y)
		bird.direction = Vector2(1,0)
	else:
		bird.position = Vector2(300, spawn_y)
		bird.direction = Vector2(-1,0)
		
	get_tree().current_scene.add_child(bird)
