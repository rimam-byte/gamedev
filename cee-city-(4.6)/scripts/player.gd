extends CharacterBody2D
var climb = false
var climbing = false
const CLIMB_SPEED= 180.0
const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const GRAVITY = 980.0

func _physics_process(delta):

	if climbing:
		velocity.y = 0
		if Input.is_action_pressed('ui_up'):
			velocity.y= -CLIMB_SPEED
		elif Input.is_action_pressed('ui_down'):
			velocity.y = CLIMB_SPEED
	else:
		if not is_on_floor():
			velocity.y += GRAVITY * delta
	var direction = Input.get_axis ('ui_left', 'ui_right')
	if direction:
		velocity.x = direction *SPEED
	else:
		velocity.x = 0
	if Input.is_action_just_pressed ('jump') and is_on_floor():
		velocity.y = JUMP_VELOCITY
	position.x= clamp(position.x,-570,570)
	if climb and Input.is_action_pressed('ui_up'):
		climbing= true
	if climbing and is_on_floor():
		climbing= false
	move_and_slide()
	
	
