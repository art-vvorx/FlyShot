extends Sprite

var obj_gg
var move_left
var move_right
var return_move

func _ready():
	obj_gg = get_node("/root/main/gg")
	obj_gg.connect("anim_move_gg_left", self, "_on_anim_move_gg_left" )
	obj_gg.connect("anim_move_gg_right", self, "_on_anim_move_gg_right")
	obj_gg.connect("anim_return_move_gg", self, "_on_anim_return_move_gg")
	
func _on_anim_move_gg_left():
	move_left = 1
	
func _on_anim_move_gg_right():
	move_right = 1
	
func _on_anim_return_move_gg():
	return_move = 1
	
func _process(delta):
	if move_left == 1:
		obj_gg.rotation_degrees += 50 * delta
		if obj_gg.rotation_degrees >= 6:
			obj_gg.rotation_degrees = 6
		obj_gg.scale.x -= 0.9 * delta
		if obj_gg.scale.x < 0.75:
			obj_gg.scale.x = 0.75
			
	elif move_right == 1:
		obj_gg.rotation_degrees -= 50 * delta
		if obj_gg.rotation_degrees <= -6:
			obj_gg.rotation_degrees = -6
		obj_gg.scale.x -= 0.9 * delta
		if obj_gg.scale.x < 0.75:
			obj_gg.scale.x = 0.75
			
	elif return_move == 1:
		if obj_gg.rotation_degrees >= 0:
			obj_gg.rotation_degrees -= 50 * delta
			if obj_gg.rotation_degrees == 0:
				obj_gg.rotation_degrees = 0
		if obj_gg.rotation_degrees < 0:
			obj_gg.rotation_degrees += 50 * delta
			if obj_gg.rotation_degrees == 0:
				obj_gg.rotation_degrees = 0
		if obj_gg.scale.x < 1:
			obj_gg.scale.x += 0.9 * delta
			if obj_gg.scale.x > 1:
				obj_gg.scale.x = 1
	
	move_left = 0
	move_right = 0
	return_move = 0

