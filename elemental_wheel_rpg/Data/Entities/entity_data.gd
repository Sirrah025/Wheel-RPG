class_name Entity_Data
extends Resource

@export var resistances = {
	GlobalEnums.DamageType.FIRE: GlobalEnums.Resistance.NEUTRAL,
	GlobalEnums.DamageType.WATER: GlobalEnums.Resistance.NEUTRAL,
	GlobalEnums.DamageType.WIND: GlobalEnums.Resistance.NEUTRAL,
	GlobalEnums.DamageType.EARTH: GlobalEnums.Resistance.NEUTRAL
}

@export var Max_HP := 8
@export var Attack = 4 # Determines how much damage is calculated
@export var Defense = 3 # Determines how much damage is reduced
@export var Speed = 1 # Determines order that moves happen in combat


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
