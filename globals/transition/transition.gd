extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

func change_scene(path: String, duration: float = 0.4) -> void:
	await _fade_to(1.0, duration)
	get_tree().change_scene_to_file(path)
	await get_tree().scene_changed
	await _fade_to(0.0, duration)

func _fade_to(alpha: float, duration: float) -> void:
	var tween := create_tween()
	tween.tween_property(color_rect, "modulate:a", alpha, duration)
	await tween.finished
