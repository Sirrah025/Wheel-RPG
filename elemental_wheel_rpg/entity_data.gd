extends Resource

@export var resistances = {
	GlobalEnums.DamageType.FIRE: GlobalEnums.Resistance.NEUTRAL,
	GlobalEnums.DamageType.WATER: GlobalEnums.Resistance.NEUTRAL,
	GlobalEnums.DamageType.EARTH: GlobalEnums.Resistance.NEUTRAL,
	GlobalEnums.DamageType.WIND: GlobalEnums.Resistance.NEUTRAL
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
