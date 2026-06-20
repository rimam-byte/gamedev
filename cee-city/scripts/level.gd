extends Node2D
var score = 0
var high_score = 0
const SAVEFILE ='user://savefile.save'

@onready var score_label = $CanvasLayer/ScoreLabel
@onready var high_score_label = $CanvasLayer/HighScoreLabel

func update_score_display():
	print("Score =", score)
	print("High =", high_score)

	score_label.text = 'Score: ' + str(score)
	high_score_label.text = 'High Score: ' + str(high_score)
	
func add_score(points: int):
	score += points
	if score > high_score:
		high_score = score
		save_high_score()
	update_score_display()
	
func _ready():
	load_high_score()
	score=0
	update_score_display()


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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
