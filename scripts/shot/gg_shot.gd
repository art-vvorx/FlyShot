extends CollisionPolygon2D

const ROCKET_SCENE = preload("res://elements/rocket.tscn")
const gg_bullets_path = "/root/main/gg_bullets"

var gg_bullets

var last_click_time = 0.0
const MAX_DOUBLE_CLICK_TIME = 0.25

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and is_within_bounds(event.position) or event.button_index == BUTTON_RIGHT:
			var current_time = OS.get_ticks_msec() / 1000.0
			if current_time - last_click_time < MAX_DOUBLE_CLICK_TIME:
				shot()
			last_click_time = current_time

func is_within_bounds(position):
	return position.x >= 0 and position.x <= 540 and position.y >= 70 and position.y <= 1200

func shot():
	gg_bullets = get_node(gg_bullets_path)
	var rocket_shot = ROCKET_SCENE.instance()
	rocket_shot.set_as_toplevel(true)
	rocket_shot.global_position = global_position + Vector2(0,-145)
	gg_bullets.add_child(rocket_shot)
	
