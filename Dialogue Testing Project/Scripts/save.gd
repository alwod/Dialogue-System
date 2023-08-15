extends Node

const SAVE_FILE = "user://save_file.save"

var game_data = {}

func _ready():
	load_data()

# Checks if a save file exists. If not, create default options
func load_data():
	if not FileAccess.file_exists(SAVE_FILE):
		reset_options()
	
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	game_data = file.get_var()
	file.close()

func save_data():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	file.store_var(game_data)
	file.close()

func reset_options():
	game_data = {
			"display_mode": 0,
			"vsync_on": false,
			"display_fps": false,
			"brightness": 50.0,
			"master_volume": -10.0,
			"sfx_volume": -10.0,
			"music_volume": -10.0,
			"sensitivity": 0.002
		}
	save_data()
