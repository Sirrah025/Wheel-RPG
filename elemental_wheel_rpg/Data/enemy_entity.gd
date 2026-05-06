class_name Enemy_Entity
extends Entity

func select_move() -> Move_Data:
	randomize()
	return moves.pick_random()
