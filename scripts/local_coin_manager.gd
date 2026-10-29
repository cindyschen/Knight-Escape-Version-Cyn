extends Node

var score = 0
var totalCoins = 4
@onready var score_label: Label = $"ScoreLabel"

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " out of "+ str(totalCoins) + " coins."
