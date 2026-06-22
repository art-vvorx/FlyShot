extends Node2D

var wall1 = preload("res://elements/wall1.tscn")
var wall2 = preload("res://elements/wall2.tscn")
var wall3 = preload("res://elements/wall3.tscn")
var wall4 = preload("res://elements/wall4.tscn")
var walls_pool = [wall1, wall2, wall3, wall4]
var position1 = Vector2(0, 0)
var position2 = Vector2(0, -1390)
var position3 = Vector2(0, -2780)
var num_rand_1
var num_rand_2
var num_rand_3
var rand_wall_1
var rand_wall_2
var rand_wall_3
var spawned_wall_1
var spawned_wall_2
var spawned_wall_3

func _ready():
	randomize()
	num_rand_1 = randi() % 4
	while num_rand_1 == num_rand_2 or num_rand_1 == num_rand_3:
		num_rand_1 = randi() % 4
	
	num_rand_2 = randi() % 4
	while num_rand_2 == num_rand_1 or num_rand_2 == num_rand_3:
		num_rand_2 = randi() % 4
	
	num_rand_3 = randi() % 4
	while num_rand_3 == num_rand_1 or num_rand_3 == num_rand_2:
		num_rand_3 = randi() % 4
	
	rand_wall_1 = walls_pool[num_rand_1]
	rand_wall_2 = walls_pool[num_rand_2]
	rand_wall_3 = walls_pool[num_rand_3]
	
	spawned_wall_1 = rand_wall_1.instance()
	spawned_wall_2 = rand_wall_2.instance()
	spawned_wall_3 = rand_wall_3.instance()
	spawned_wall_1.position = position1
	spawned_wall_2.position = position2
	spawned_wall_3.position = position3
	add_child(spawned_wall_1)
	add_child(spawned_wall_2)
	add_child(spawned_wall_3)

func _process(_delta):
	if spawned_wall_1.position.y >= 1390:
		num_rand_1 = randi() % 4
		while num_rand_1 == num_rand_2 or num_rand_1 == num_rand_3:
			num_rand_1 = randi() % 4
		num_rand_2 = randi() % 4
		while num_rand_2 == num_rand_1 or num_rand_2 == num_rand_3:
			num_rand_2 = randi() % 4
		num_rand_3 = randi() % 4
		while num_rand_3 == num_rand_1 or num_rand_3 == num_rand_2:
			num_rand_3 = randi() % 4
		rand_wall_1 = walls_pool[num_rand_1]
		spawned_wall_1.queue_free()
		spawned_wall_1 = rand_wall_1.instance()
		spawned_wall_1.position = position3
		add_child(spawned_wall_1)
	
	if spawned_wall_2.position.y >= 1390:
		rand_wall_2 = walls_pool[num_rand_2]
		spawned_wall_2.queue_free()
		spawned_wall_2 = rand_wall_2.instance()
		spawned_wall_2.position = position3
		add_child(spawned_wall_2)
		
	if spawned_wall_3.position.y >= 1390:
		rand_wall_3 = walls_pool[num_rand_3]
		spawned_wall_3.queue_free()
		spawned_wall_3 = rand_wall_3.instance()
		spawned_wall_3.position = position3
		add_child(spawned_wall_3)

