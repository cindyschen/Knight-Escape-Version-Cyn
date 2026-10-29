extends Area2D

@export_file("*.tscn") var next_level: String
@onready var fade: CanvasLayer = $"../Fade"

func _on_body_entered(body: Node2D) -> void:
	GameManager.complete_level()
	await fade.fade()
	get_tree().change_scene_to_file(next_level)
	print("Reached exit")
	
