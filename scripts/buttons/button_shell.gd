extends TextureButton

const gg_path = "/root/main/gg"

var gg

func _ready():
	gg = get_node(gg_path)

func _pressed():
	# Включаем режим "неуязвимости"
	gg.set_meta("invincible", true)
	gg.set_process(false)  # Отключаем обработку
	gg.set_physics_process(false)
	for child in gg.get_children():
		if child is CollisionShape2D or child is CollisionPolygon2D:
			child.disabled = true
	gg.visible = false
	
	# Ждем 5 секунд
	yield(get_tree().create_timer(3.0), "timeout")
	
	# Возвращаем все параметры в исходное состояние
	gg.set_meta("invincible", false)
	gg.set_process(true)  # Отключаем обработку
	gg.set_physics_process(true)
	for child in gg.get_children():
		if child is CollisionShape2D or child is CollisionPolygon2D:
			child.disabled = false
	gg.visible = true
