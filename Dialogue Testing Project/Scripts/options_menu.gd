extends Control

# Video settings
@onready var display_options = $TabContainer/Video/MarginContainer/GridContainer/DisplayModeOptionsButton
@onready var vsync_button = $TabContainer/Video/MarginContainer/GridContainer/VsyncCheckButton
@onready var display_fps_button = $TabContainer/Video/MarginContainer/GridContainer/DisplayFPSButton
@onready var brightness_value = $TabContainer/Video/MarginContainer/GridContainer/HBoxContainer/DisplayBrightnessLabel
@onready var brightness_slider = $TabContainer/Video/MarginContainer/GridContainer/HBoxContainer/BrightnessSlider

# Audio settings
@onready var master_volume_value = $TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer/DisplayMasterVolumeLabel
@onready var master_volume_slider = $TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer/MasterVolumeSlider
@onready var sfx_volume_value = $TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer2/DisplaySFXVolumeLabel
@onready var sfx_volume_slider = $TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer2/SFXVolumeSlider
@onready var music_volume_value = $TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer3/DisplayMusicVolumeLabel
@onready var music_volume_slider = $TabContainer/Audio/MarginContainer/GridContainer/HBoxContainer3/MusicVolumeSlider

# Gameplay Settings
@onready var sensitivity_value = $TabContainer/Gameplay/MarginContainer/GridContainer/HBoxContainer/DisplaySensitivityLabel
@onready var sensitivity_slider = $TabContainer/Gameplay/MarginContainer/GridContainer/HBoxContainer/SensitivitySlider


func _ready():
	pass # Replace with function body.


func _on_display_mode_options_button_item_selected(index):
	pass # Replace with function body.


func _on_vsync_check_button_toggled(button_pressed):
	pass # Replace with function body.


func _on_display_fps_button_toggled(button_pressed):
	pass # Replace with function body.


func _on_brightness_slider_value_changed(value):
	pass # Replace with function body.


func _on_master_volume_slider_value_changed(value):
	pass # Replace with function body.


func _on_sfx_volume_slider_value_changed(value):
	pass # Replace with function body.


func _on_music_volume_slider_value_changed(value):
	pass # Replace with function body.


func _on_sensitivity_slider_value_changed(value):
	pass # Replace with function body.
