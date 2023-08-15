extends WorldEnvironment

func _ready():
	GlobalSettings.brightness_level.connect(_on_brightness_updated)

func _on_brightness_updated(value: float):
	environment.adjustment_brightness = value
