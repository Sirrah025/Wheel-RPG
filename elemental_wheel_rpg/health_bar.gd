extends ProgressBar

@export var entity: Entity

func _ready() -> void:
	max_value = entity.entity_data.Max_HP
	value = entity.HP


func _on_change_health_value_visual(hp: int) -> void:
	var tween = create_tween()
	tween.tween_property(self, "value", hp, 1).set_trans(Tween.TRANS_CUBIC)
