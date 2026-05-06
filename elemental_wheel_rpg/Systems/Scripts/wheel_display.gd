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
	player_moves.visible = false
	wheel.open_wheel()
