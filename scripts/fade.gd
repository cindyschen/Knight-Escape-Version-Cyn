extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	color_rect.color.a = 0.0

func fade():
	
	var tween = create_tween()
	tween.tween_property(color_rect, "color:a", 1.0, 1.0)
	await tween.finished
	
	return tween
