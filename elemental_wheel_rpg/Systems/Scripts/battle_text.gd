extends RichTextLabel

@export var text_dictionary = {}

signal player_won
signal player_lost


func _ready():
	visible_ratio = 0.0

func type_text() -> void:
	visible_ratio = 0.0
	
	var tween = create_tween()
	tween.tween_property(self, "visible_ratio", 1.0, 1.0).from(0.0)
	await tween.finished

func _on_player_lost() -> void:
	text = text_dictionary[&"Player Defeated"].text_to_render
	type_text()
	player_lost.emit()

func _on_player_won() -> void:
	text = text_dictionary[&"Enemy Defeated"].text_to_render
	type_text()
	player_won.emit()
