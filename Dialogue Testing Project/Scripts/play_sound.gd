extends Node

func _on_play_sound(sound):
	match sound:
		"button":
			print("got here")
		_: # Default
			print("sound not found")
