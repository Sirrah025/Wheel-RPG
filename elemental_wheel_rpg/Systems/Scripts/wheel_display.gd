extends Control


@onready var wheel = $Wheel
@onready var damage_text = %Damage
@onready var player_moves = %"Player Moves"


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
