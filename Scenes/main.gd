extends Node3D

@onready var clock = $UI/Clock
@onready var date_label = $UI/DateLabel

var month_names = [
	"JAN", "FEB", "MAR", "APR", "MAY", "JUN",
	"JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
]


func _process(delta: float) -> void:
	var now = Time.get_datetime_dict_from_system()

	# ВРЕМЯ
	var hour = str(now.hour).pad_zeros(2)
	var minute = str(now.minute).pad_zeros(2)
	clock.text = hour + ":" + minute

	# ДАТА
	var day = str(now.day).pad_zeros(2)
	var month = month_names[now.month - 1]

	date_label.text = day + " " + month


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			get_tree().change_scene_to_file("res://scenes/HabitTracker.tscn")
