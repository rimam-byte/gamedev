extends Node2D
var score = 0
var high_score = 0
var time_left = 30.0
const SAVEFILE ='user://savefile.save'
#@export var max_ammo= 10
#@onready var current_ammo= max_ammo
@onready var score_label = $CanvasLayer/Score
@onready var high_score_label = $CanvasLayer/HighScore
@onready var timer_label = $CanvasLayer/Timer
@onready var ammo_label = $CanvasLayer/Ammo

func update_score():
	score_label.text = 'Score: ' + str(score)
	high_score_label.text = 'High Score: ' + str(high_score)
#func update_ammo():
	#ammo_label.text = 'Ammo: ' + str(current_ammo)
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
	
func _process(delta: float) -> void:
	time_left -= delta
	if time_left <0:
		time_left = 0
		game_over()
		
	update_timer()
	
func update_timer():
	var min = int(time_left)/60
	var sec= int(time_left)%60
	timer_label.text = str(min) +':'+ str(sec)
	
	
func game_over():
	print("Game over")
	get_tree().paused = true
	
	
	
	
	
	
	
	
	
