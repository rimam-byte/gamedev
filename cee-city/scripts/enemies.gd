extends CharacterBody2D
@export var speed := 100.0
var direction:= Vector2.ZERO
var change_timer := 0.0

func _ready():
	pick_new_direction()
	
func _physics_process(delta):
	change_timer -= delta
	
	#change direction every -2 seconds
	
	if change_timer <=0:
		pick_new_direction()
		
	velocity = direction * speed
	move_and_slide()
	
func pick_new_direction():
	direction = Vector2(
		randf_range (-1,1),
		randf_range (-1,1)
	).normalized()
	
	change_timer = randf_range (1.0, 3.0)
