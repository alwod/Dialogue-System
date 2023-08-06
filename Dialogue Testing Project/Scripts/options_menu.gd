extends Control

# Changes the display mode of the window. - BORDERLESS NOT COMPLETE.
func _on_display_mode_options_button_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
		1:
			print("Windowed Borderless")
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

# Enables / disables VSync.
func _on_vsync_check_button_toggled(button_pressed):
	if (button_pressed):
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

# Called when a button is pressed. Plays the button-pressing sound.
func pressed():
	play_button_sound()

# Changes the camera sensitivity in the project settings.
func _on_sensitivity_slider_value_changed(value):
	ProjectSettings.set_setting("player/camera_sensitivity", value)

# This is a function as not all UI elements that need to play this sound when clicked, are buttons.
func play_button_sound():
	$ButtonPressSoundPlayer.play()

# Displays the FPS - NOT COMPLETE.
func _on_display_fps_button_toggled(button_pressed):
	pass # Replace with function body.
