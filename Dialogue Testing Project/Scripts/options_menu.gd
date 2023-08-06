extends Control

# Called when the display mode is changed.
func _on_display_mode_options_button_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
		1:
			print("Windowed Borderless")
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

# Called when vsync button is pressed.
func _on_vsync_check_button_toggled(button_pressed):
	if (button_pressed):
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

# Called when any button is pressed to play a sound.
func pressed():
	play_button_sound()

func _on_sensitivity_slider_value_changed(value):
	ProjectSettings.set_setting("player/camera_sensitivity", value)

func play_button_sound():
	$ButtonPressSoundPlayer.play()
