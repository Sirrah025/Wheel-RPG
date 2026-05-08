class_name Player_Entity
extends Entity

signal player_defeated


func _on_player_health_at_zero() -> void:
	player_defeated.emit()
