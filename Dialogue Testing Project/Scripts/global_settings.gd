extends Node

signal fps_display(value: bool)

# Changes the display mode of the window.
# 0 is Windowed, 1 is Windowed Borderless, and 2 is Fullscreen.
func change_display_mode(value: int):
	match value:
		0:
			ProjectSettings.set_setting("display/window/size/borderless", false)
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
		1:
			if DisplayServer.window_get_mode(DisplayServer.WINDOW_MODE_FULLSCREEN):
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
			ProjectSettings.set_setting("display/window/size/borderless", true)
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			
# Enables or disables Vsync.
func toggle_vsync(value: bool):
	if (value):
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

# Emits a signal to show or hide the fps display box.
func toggle_fps_display(value: bool):
	fps_display.emit(value)

# Changes the brightness of the game.
func set_brightness(value):
	pass
