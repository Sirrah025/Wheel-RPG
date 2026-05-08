class_name Enemy_Entity
extends Entity

signal enemy_defeated

func select_move() -> Move_Data:
	randomize()
	return moves.pick_random()


func _on_enemy_health_at_zero() -> void:
	enemy_defeated.emit()
