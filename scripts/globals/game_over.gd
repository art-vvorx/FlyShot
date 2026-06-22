extends Node2D

var gg = "/root/main/gg"
const game_over_scene = "res://scenes/menu.tscn"

func _process(_delta):
	if not has_node(gg):
		load_scene_game_over()
		
func load_scene_game_over():
	var _change_scene = get_tree().change_scene(game_over_scene)
