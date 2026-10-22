extends StaticBody2D

@onready var door_trigger: Area2D = $DoorTrigger
@onready var open_the_door_label: Label = $OpenTheDoorLabel

var is_close_to_the_door = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	door_trigger.body_entered.connect(someone_approched_door)
	door_trigger.body_exited.connect(away_from_the_door)
	
	open_the_door_label.hide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("action"):
		if not is_close_to_the_door:
			return
		get_inside()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func someone_approched_door(body: Node2D) -> void:
	if body is Player:
		open_the_door_label.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func away_from_the_door(body: Node2D) -> void:
	if body is Player:
		open_the_door_label.hide()

func get_inside() -> void:
	pass
