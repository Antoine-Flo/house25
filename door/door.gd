extends Area2D

@onready var open_the_door_label: Label = $OpenTheDoorLabel

@export var label: String
@export_file("*.tscn") var next_scene: String

var is_close_to_the_door = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(someone_approched_door)
	body_exited.connect(away_from_the_door)
	open_the_door_label.text = label
	open_the_door_label.hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("action"):
		if not is_close_to_the_door:
			return
		get_viewport().set_input_as_handled()
		go_through()

func someone_approched_door(body: Node2D) -> void:
	if body is Player:
		is_close_to_the_door = true
		open_the_door_label.show()

func away_from_the_door(body: Node2D) -> void:
	if body is Player:
		is_close_to_the_door = false
		open_the_door_label.hide()

func go_through() -> void:
	Transition.change_scene(next_scene)
