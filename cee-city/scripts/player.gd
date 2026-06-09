extends CharacterBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const GRAVITY = 980.0


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		
	var direction = Input.get_axis ('ui_left', 'ui_right')
	
	if direction:
		velocity.x = direction *SPEED
		
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed ('ui_accept') and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	move_and_slide()
