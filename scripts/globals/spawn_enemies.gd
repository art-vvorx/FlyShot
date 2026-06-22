extends Node2D

var screen_width
var screen_height
var enemy_scene = preload("res://elements/enemy.tscn")
var enemy_boss = preload("res://elements/enemy_boss.tscn")

signal change_score
signal change_score_boss

func _ready():
	var screen_size = get_viewport_rect().size
	screen_width = screen_size.x
	screen_height = screen_size.y
	spawn_enemies()
	
func _process(_delta):
	if get_tree().get_nodes_in_group("enemies").size() == 0:
		emit_signal("change_score")
		spawn_enemies()
	
func _on_check_boss_kill():
	emit_signal("change_score_boss")

func spawn_enemies():
	randomize() #Нужен для рандома при первом старте
	var num_enemies = randi() % 8 + 1  # Генерируем случайное число от 1 до 10
	var rnd_enemy_class = randi() % 2 # Нужно для обычных мобов или босса
	var spawned_enemies = []  # Список для отслеживания заспауненных врагов
	#rnd_enemy_class = 1
	if rnd_enemy_class == 1:
		var enemy_boss_instance = enemy_boss.instance()
		var boss_pos_x = rand_range(-170, 170)
		var boss_pos_y = rand_range(-150, -450)
		enemy_boss_instance.position = Vector2(boss_pos_x, boss_pos_y)
		add_child(enemy_boss_instance)
		enemy_boss_instance.add_to_group("enemies")
		enemy_boss_instance.connect("check_boss_kill", self, "_on_check_boss_kill")
		
	else:
		for _i in range(num_enemies):
			var enemy_instance = enemy_scene.instance()
			var pos_x = rand_range(-170, 170)
			var pos_y = rand_range(-150, -450)
			var new_position = Vector2(pos_x, pos_y)
			var overlap = false
			for spawned_enemy in spawned_enemies:
				var distance = new_position.distance_to(spawned_enemy.position)
				var minimum_distance = 75
				if distance <= minimum_distance:  # Замените your_minimum_distance на нужное вам значение
					overlap = true
					break
			# Если нет наложения, добавляем врага в сцену и в список spawned_enemies
			if not overlap:
				enemy_instance.position = new_position
				add_child(enemy_instance)
				enemy_instance.add_to_group("enemies")
				spawned_enemies.append(enemy_instance)
