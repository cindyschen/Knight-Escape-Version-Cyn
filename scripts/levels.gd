extends Control
@onready var coins: RichTextLabel = $PanelContainer/Coins

func _ready() -> void:
	coins.text = str(GameManager.total_collected) + "/" + str(GameManager.total_coins)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level1.tscn")
	
func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level2.tscn")

func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level3.tscn")

func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/finallevel.tscn")
