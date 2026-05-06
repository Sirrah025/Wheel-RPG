class_name Entity
extends Node

signal entity_at_zero_hp

@export var entity_data: Entity_Data
@export var moves: Array[Move_Data]

var HP: int:
	set(new_HP):
		HP = clamp(HP + new_HP, 0, entity_data.Max_HP)
		if HP == 0:
			entity_at_zero_hp.emit()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HP = entity_data.Max_HP


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
