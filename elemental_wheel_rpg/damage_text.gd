extends RichTextLabel

var damage_text
var total_damage := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	damage_text = text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset_damage_display() -> void:
	total_damage = 0
	text = damage_text + str(total_damage)

func _on_wheel_new_dir_chosen(payload: RefCounted) -> void:
	total_damage += payload.slice_value
	text = damage_text + str(total_damage)
