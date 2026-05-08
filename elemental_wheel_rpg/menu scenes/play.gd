extends Button

@export var battle_music : AudioStreamOggVorbis

func _on_pressed() -> void:
	MusicHandler.stream = battle_music
	MusicHandler.play()
	get_tree().change_scene_to_file("res://prototype_battle_scene.tscn")
