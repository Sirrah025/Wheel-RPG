extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _handle_dir_chosen(payload) -> void:
	print_debug("base_value: " + str(payload.base_value))
	print_debug("slice_multiplier: " + str(payload.slice_value))
	print_debug("total_value: " + str(payload.total_value))
	print_debug("Damage_Type: " + str(payload.damage_type))
