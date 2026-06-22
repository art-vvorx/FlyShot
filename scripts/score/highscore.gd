extends Label

var highscore
var lock_key = ""
var highscore_file = "user://highscore.dat"

func _ready():
	load_highscore()

func load_highscore():
	if File.new().file_exists(highscore_file):
		var file = File.new()
		file.open_encrypted_with_pass(highscore_file, File.READ, lock_key)
		var highscore_data = file.get_as_text()
		text = str(highscore_data)
		file.close()
	else:
		highscore = 0
		text = str(highscore)
		save_highscore()

func save_highscore():
	var file = File.new()
	file.open_encrypted_with_pass(highscore_file, File.WRITE, lock_key)
	var highscore_data = str(highscore)
	file.store_string(highscore_data)
	file.close()
