class_name Entity
extends Node

signal entity_at_zero_hp
signal change_health_value_visual(hp: int)

@export var entity_data: Entity_Data
@export var moves: Array[Move_Data]

var HP: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HP = entity_data.Max_HP


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func take_damage(damage: int) -> void:
	HP = clamp(HP - damage, 0, entity_data.Max_HP)

func heal_health(heal: int) -> void:
	HP = clamp(HP + heal, 0, entity_data.Max_HP)

func change_visual() -> void:
	change_health_value_visual.emit(HP)
	
	if HP == 0:
		entity_at_zero_hp.emit()
