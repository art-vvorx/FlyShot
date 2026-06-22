extends Label

var score = 0
var highscore_file = "user://highscore.dat"
var highscore
var lock_key = ""

func _ready():
	load_highscore()
	var enemies_pool = get_node("/root/main/spawn_enemies")
	enemies_pool.connect("change_score", self, "_on_change_score")
	enemies_pool.connect("change_score_boss", self, "_on_change_score_boss")

func _on_change_score():
	score += 1
	if score > highscore:
		highscore = score
		save_highscore()
	update_score_ui()

func _on_change_score_boss():
	score += 2
	if score > highscore:
		highscore = score
		save_highscore()
	update_score_ui()

func update_score_ui():
	text = str(score)

func load_highscore():
	if File.new().file_exists(highscore_file):
		var file = File.new()
		file.open_encrypted_with_pass(highscore_file, File.READ, lock_key)
		var highscore_data = file.get_as_text()
		highscore = int(highscore_data)
		file.close()
	else:
		highscore = "0"
		save_highscore()
		
func save_highscore():
	var file = File.new()
	file.open_encrypted_with_pass(highscore_file, File.WRITE, lock_key)
	file.store_string(str(highscore))
	file.close()

