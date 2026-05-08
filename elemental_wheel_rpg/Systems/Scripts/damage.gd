class_name Damage
extends Node

var damage_amount: int
# var damage_type: GlobalEnums.DamageType
var user: Entity_Data
var target: Entity_Data
var move: Move_Data

func get_total_damage() -> int:
	var total_damage := 0
	var damage_coefficient = user.Attack / target.Defense
	total_damage = damage_amount * damage_coefficient * move.power
	return total_damage
