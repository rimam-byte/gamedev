extends CharacterBody2D
@export var speed := 100.0
@export var mine_scene: PackedScene
@export var mine_chance= 0.3 #30 percent of drones throw mines
var will_throw_mine = false
var has_dropped = false

func _ready():
	will_throw_mine = randf()<mine_chance
func _physics_process(delta: float) -> void:
	position.x -= speed *delta
	if will_throw_mine and not has_dropped and position.x<300:
		has_dropped = true
		drop_mine()
func drop_mine():
	var mine = mine_scene.instantiate()
	mine.global_position = global_position
	get_tree().current_scene.add_child(mine)
