extends TextureButton

const gg_path = "/root/main/gg"

var gg
var btn_normal_texture
var btn_pressed_texture

func _ready():
	gg = get_node(gg_path)
	btn_normal_texture = texture_normal
	btn_pressed_texture = texture_pressed

func _pressed():
	gg.set_meta("invincible", true)
	gg.modulate = Color(1, 1, 1, 0.3)
	texture_normal = btn_pressed_texture
	yield(get_tree().create_timer(3.0), "timeout")
	gg.set_meta("invincible", false)
	gg.modulate = Color(1, 1, 1, 1)
	texture_normal = btn_normal_texture