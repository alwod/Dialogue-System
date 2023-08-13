extends Node

const SAVE_FILE = "user://SAVE_FILE.save"

var game_data = {}

func _ready():
	load_data()
	
# Checks if a save file exists. If not create default options
func load_data():
	if not FileAccess.file_exists(SAVE_FILE):
		game_data = {
			"display_mode": 0,
			"vsync_on": false,
			"display_fps": false,
			"brightness": 1
		}
		save_data()
	
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	game_data = file.get_var()
	file.close()
	
func save_data():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	file.store_var(game_data)
	file.close()
