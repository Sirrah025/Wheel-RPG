extends Control


@onready var wheel = $Wheel
@onready var damage_text = %Damage
@onready var player_moves = %"Player Moves"
@onready var pos_indicator = $"Positive Indicator"
@onready var neg_indicator = $"Negative Indicator"

@export var enemy: Entity


func _on_wheel_puzzle_finished() -> void:
	wheel.visible = false
	damage_text.visible = false
	player_moves.visible = true


func _on_prototype_battle_scene_start_wheel() -> void:
	wheel.visible = true
	damage_text.visible = true
	wheel.open_wheel()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Transition to Wheel":
		wheel.open_wheel()


func _on_wheel_new_dir_selected() -> void:
	var element = wheel.current_direction / 90
	var entity_resistances = enemy.entity_data.resistances
	if entity_resistances[element] == GlobalEnums.Resistance.RESISTANT:
		neg_indicator.visible = true
		pos_indicator.visible = false
	elif entity_resistances[element] == GlobalEnums.Resistance.WEAK:
		neg_indicator.visible = false
		pos_indicator.visible = true
	else:
		neg_indicator.visible = false
		pos_indicator.visible = false
		
