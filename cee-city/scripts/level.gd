extends Node2D
var score = 0
var high_score = 0
var time_left = 60.0
var ammo= 20.0
var speed_timer = 0.0
var current_drone_speed = 100
const SAVEFILE ='user://savefile.save'
@onready var score_label = $CanvasLayer/Score
@onready var high_score_label = $CanvasLayer/HighScore
@onready var timer_label = $CanvasLayer/Timer
@onready var ammo_label = $CanvasLayer/Ammo
@onready var pause_menu = $CanvasLayer3/pausemenu
func update_score():
	score_label.text =str(score)
	high_score_label.text = 'Best: ' + str(high_score)
func add_score(points: int):
	score += points
	if score > high_score:
		high_score = score
		save_high_score()
	update_score()
func _ready():
	load_high_score()
	score=0
	update_score()
	update_ammo_label()



func load_high_score():
	if FileAccess.file_exists('user://save.dat'):
		var file = FileAccess.open('user://save.dat', FileAccess.READ)
		high_score = file.get_var()
		file.close()
	else:
		high_score = 0
	
func save_high_score():
	var file = FileAccess.open('user://save.dat', FileAccess.WRITE)
	file.store_var(high_score)
	file.close()
	
	
func reload_high_score():
	high_score=0
	save_high_score()
	update_score()
	
func _process(delta: float) -> void:
	time_left -= delta
	speed_timer += delta
	
	if speed_timer>=10:
		speed_timer= 0
		increase_drone_speed()
		
	if time_left <0:
		time_left = 0
		game_over()
		
	update_timer()
	
func increase_drone_speed():
	current_drone_speed+= 50
	
	for drone in get_tree().get_nodes_in_group('drone'):
		drone.speed = current_drone_speed
		
func update_timer():
	var minute = int(time_left/60)
	var sec= int(time_left)%60
	
	if sec<10:
		timer_label.text= str(minute)+ ':0'+ str(sec)
	else:
		timer_label.text = str(minute) +':'+ str(sec)


func game_over():
	print("Game over")
	get_tree().paused = true
	
func update_ammo_label():
	ammo_label.text =str(int(ammo))
	
func use_ammo() -> bool:
	if ammo>0:
		ammo -= 1
		update_ammo_label()
		return true
	return false
	
func add_ammo(amount):
	ammo+= amount
	update_ammo_label()
	

func _on_pause_pressed() -> void:
	pause_menu.visible = true
	get_tree().paused = true
	


func _on_pausemenu_resume_requested() -> void:
	$CanvasLayer3/pausemenu.visible = false
	get_tree().paused= false


func _on_button_pressed() -> void:
	reload_high_score()
