class_name Damage
extends Node

var damage_amount: int
# var damage_type: GlobalEnums.DamageType
var user: Entity_Data
var target: Entity_Data
var move: Move_Data

const DAMAGE_SCALE := 5

func get_total_damage() -> int:
	# _debug_damage()
	var damage_coefficient = float(user.Attack) / float(target.Defense)
	var total_damage = int((damage_coefficient * damage_amount + move.power)/DAMAGE_SCALE)
	return total_damage


func _debug_damage() -> void:
	print_debug(damage_amount)
	print_debug(user.Attack)
	print_debug(target.Defense)
