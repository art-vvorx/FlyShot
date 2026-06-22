extends Node2D

var highscore_file = "user://highscore.dat"
var highscore
var lock_key = ""

func _ready():
	save_highscore()

func save_highscore():
	var file = File.new()
	highscore = 0
	file.open_encrypted_with_pass(highscore_file, File.WRITE, lock_key)
	file.store_string(str(highscore))
	file.close()
