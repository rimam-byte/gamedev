extends Node2D
var score = 0
var high_score = 0

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
	update_score_display()
	
func _ready():
	update_score_display()
