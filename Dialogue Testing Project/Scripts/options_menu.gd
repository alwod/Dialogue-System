extends Control

# Video settings
@onready var display_options = $TabContainer/Video/MarginContainer/GridContainer/DisplayModeOptionsButton
@onready var vsync_button = $TabContainer/Video/MarginContainer/GridContainer/VsyncCheckButton
@onready var display_fps_button = $TabContainer/Video/MarginContainer/GridContainer/DisplayFPSButton
@onready var brightness_display = $TabContainer/Video/MarginContainer/GridContainer/HBoxContainer/DisplayBrightnessLabel
@onready var brightness_slider = $TabContainer/Video/MarginContainer/GridContainer/HBoxContainer/BrightnessSlider

# Audio settings
@onready var master_volume_display = $TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer/DisplayMasterVolumeLabel
@onready var master_volume_slider = $TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer/MasterVolumeSlider
@onready var sfx_volume_display = $TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer2/DisplaySFXVolumeLabel
@onready var sfx_volume_slider = $TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer2/SFXVolumeSlider
@onready var music_volume_display = $TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer3/DisplayMusicVolumeLabel
@onready var music_volume_slider = $TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer3/MusicVolumeSlider

# Gameplay Settings
@onready var sensitivity_display = $TabContainer/Gameplay/MarginContainer/GridContainer/HBoxContainer/DisplaySensitivityLabel
@onready var sensitivity_slider = $TabContainer/Gameplay/MarginContainer/GridContainer/HBoxContainer/SensitivitySlider

@onready var click_sound = $ClickSound

var can_play_button_sound = false

# Loads settings from the save file
func _ready():
	initialise_settings()

func initialise_settings():
	display_options.select(Save.game_data["display_mode"])
	GlobalSettings.change_display_mode(Save.game_data["display_mode"])
	
	vsync_button.button_pressed = Save.game_data["vsync_on"]
	GlobalSettings.toggle_vsync(Save.game_data["vsync_on"])
	
	display_fps_button.button_pressed = Save.game_data["display_fps"]
	GlobalSettings.toggle_fps_display(Save.game_data["display_fps"])
	
	brightness_slider.value = Save.game_data["brightness"]
	
	master_volume_slider.value = Save.game_data["master_volume"]
	sfx_volume_slider.value = Save.game_data["sfx_volume"]
	music_volume_slider.value = Save.game_data["music_volume"]
	
	sensitivity_slider.value = Save.game_data["sensitivity"]
	
	can_play_button_sound = true

func _on_display_mode_options_button_item_selected(index: int):
	play_button_sound()
	GlobalSettings.change_display_mode(index)


func _on_vsync_check_button_toggled(button_pressed: bool):
	play_button_sound()
	GlobalSettings.toggle_vsync(button_pressed)


func _on_display_fps_button_toggled(button_pressed: bool):
	play_button_sound()
	GlobalSettings.toggle_fps_display(button_pressed)


func _on_brightness_slider_value_changed(brightness_value: float):
	play_button_sound()
	GlobalSettings.set_brightness(brightness_value)
	brightness_display.text = str(brightness_value)


func _on_master_volume_slider_value_changed(volume_level: float):
	play_button_sound()
	GlobalSettings.update_volume(0, volume_level)
	master_volume_display.text = str(volume_level)


func _on_sfx_volume_slider_value_changed(volume_level: float):
	play_button_sound()
	GlobalSettings.update_volume(1, volume_level)
	sfx_volume_display.text = str(volume_level)


func _on_music_volume_slider_value_changed(volume_level: float):
	play_button_sound()
	GlobalSettings.update_volume(2, volume_level)
	music_volume_display.text = str(volume_level)


# The value is normally a really long float, so its shortened and, for the display, changed to a
# number between 1 and 5.
func _on_sensitivity_slider_value_changed(sensitivity_value: float):
	play_button_sound()
	sensitivity_value = snapped(sensitivity_value, 0.0001)
	GlobalSettings.update_sensitivity(sensitivity_value)
	sensitivity_value *= 1000
	sensitivity_display.text = str(sensitivity_value)

# Resets all settings to default before re-initialising them.
func _on_default_settings_button_pressed():
	play_button_sound()
	Save.reset_options()
	initialise_settings()

func play_button_sound():
	if can_play_button_sound:
		click_sound.play()
