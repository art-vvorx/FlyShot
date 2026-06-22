extends Sprite

var boss_obj
var sprite_center
var sprite_left
var sprite_right
var move_left
var move_right

func _ready():
	boss_obj = get_node("/root/main/spawn_enemies/enemy_boss")
	sprite_center = get_node("/root/main/spawn_enemies/enemy_boss/sprite_center")
	sprite_left = get_node("/root/main/spawn_enemies/enemy_boss/sprite_left")
	sprite_right = get_node("/root/main/spawn_enemies/enemy_boss/sprite_right")
	boss_obj.connect("boss_animation_left", self, "_on_boss_animation_left")
	boss_obj.connect("boss_animation_right", self, "_on_boss_animation_right")

func _on_boss_animation_left():
	move_left = 1

func _on_boss_animation_right():
	move_right = 1
	
func _process(delta):
	if move_left == 1:
		boss_obj.rotation_degrees += 15 * delta
		if boss_obj.rotation_degrees >= 6:
			boss_obj.rotation_degrees = 6
		sprite_center.visible = false
		sprite_right.visible = false
		sprite_left.visible = true
	elif move_right == 1:
		boss_obj.rotation_degrees -= 15 * delta
		if boss_obj.rotation_degrees <= -6:
			boss_obj.rotation_degrees = -6
		sprite_center.visible = false
		sprite_right.visible = true
		sprite_left.visible = false
	else:
		boss_obj.rotation_degrees = 0
		sprite_center.visible = true
		sprite_right.visible = false
		sprite_left.visible = false 
	
	move_left = 0
	move_right = 0
