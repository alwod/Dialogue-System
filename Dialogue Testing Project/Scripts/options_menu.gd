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


func _ready():
	pass # Replace with function body.


func _on_display_mode_options_button_item_selected(index: int):
	GlobalSettings.change_display_mode(index)


func _on_vsync_check_button_toggled(button_pressed: bool):
	GlobalSettings.toggle_vsync(button_pressed)


func _on_display_fps_button_toggled(button_pressed: bool):
	GlobalSettings.toggle_fps_display(button_pressed)


func _on_brightness_slider_value_changed(brightness_value: float):
	GlobalSettings.set_brightness(brightness_value)
	brightness_display.text = str(brightness_value)


func _on_master_volume_slider_value_changed(volume_level: float):
	GlobalSettings.update_volume(0, volume_level)
	master_volume_display.text = str(volume_level)


func _on_sfx_volume_slider_value_changed(volume_level: float):
	GlobalSettings.update_volume(1, volume_level)
	sfx_volume_display.text = str(volume_level)


func _on_music_volume_slider_value_changed(volume_level: float):
	GlobalSettings.update_volume(2, volume_level)
	music_volume_display.text = str(volume_level)


# The value is normally a really long float, so its shortened and, for the display, changed to a
# number between 1 and 5.
func _on_sensitivity_slider_value_changed(sensitivity_value: float):
	sensitivity_value = snapped(sensitivity_value, 0.0001)
	GlobalSettings.update_sensitivity(sensitivity_value)
	sensitivity_value *= 1000
	sensitivity_display.text = str(sensitivity_value)
