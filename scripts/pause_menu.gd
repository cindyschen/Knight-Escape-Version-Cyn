extends CanvasLayer

func _ready() -> void:
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			hide()
			get_tree().paused = false
		else:
			show()
			get_tree().paused = true


func _on_resume_pressed() -> void:
	hide()
	get_tree().paused = false
	

func _on_home_pressed() -> void:
	hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
