extends Label

func _ready():
	GlobalSettings.fps_display.connect(_on_fps_displayed)
	
func _process(delta):
	text = "FPS: " + str(Engine.get_frames_per_second())

func _on_fps_displayed(value: bool):
	visible = value
