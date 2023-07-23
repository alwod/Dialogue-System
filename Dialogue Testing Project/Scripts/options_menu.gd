extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called when the display mode is changed.
func _on_display_mode_options_button_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
		1:
			print("Windowed Borderless")
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_vsync_check_button_toggled(button_pressed):
	if (button_pressed):
		DisplayServer.VSYNC_ENABLED
		print("Vsync enabled")
	else:
		print("vsynd disabled")
		DisplayServer.VSYNC_DISABLED
