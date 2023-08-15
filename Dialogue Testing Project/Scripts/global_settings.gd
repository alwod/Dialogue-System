extends Node

signal fps_display(value: bool)
signal brightness_level(value: float)

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
	Save.game_data["display_mode"] = value
	Save.save_data()

# Enables or disables Vsync.
func toggle_vsync(value: bool):
	if (value):
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	Save.game_data["vsync_on"] = value
	Save.save_data()

# Emits a signal to show or hide the fps display box.
func toggle_fps_display(value: bool):
	fps_display.emit(value)
	Save.game_data["display_fps"] = value
	Save.save_data()

# Changes the brightness of the game.
func set_brightness(value: float):
	brightness_level.emit(value)
	Save.game_data["brightness"] = value
	Save.save_data()

# Changes volume
func update_volume(bus_index: int, value: float):
	AudioServer.set_bus_volume_db(bus_index, value)
	match bus_index:
		0:
			Save.game_data["master_volume"] = value
		1:
			Save.game_data["sfx_volume"] = value
		2:
			Save.game_data["music_volume"] = value
	Save.save_data()

# Changes camera sensitivity
func update_sensitivity(value: float):
	ProjectSettings.set_setting("player/camera_sensitivity", value)
	Save.game_data["sensitivity"] = value
	Save.save_data()
