extends Node2D

var width
var height
var snack = preload("res://Snack.tscn")

func _ready():
	width = get_viewport_rect().size.x
	height = get_viewport_rect().size.y
	
	var inst = snack.instance()
	inst.position.x = rand_range(0, width) 
	inst.position.y = rand_range(0, height) 
	inst.connect("snack_eaten", self, "levelup")
	add_child(inst)
	randomize()

func levelup():
	get_node("Snack").position.x = rand_range(0, width) 
	get_node("Snack").position.y = rand_range(0, height)
	get_node("Snake").add_tail()
	get_node("Chomp").play()

func game_over():
	var _temp = get_tree().reload_current_scene()
