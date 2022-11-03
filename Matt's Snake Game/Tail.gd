extends Area2D

var turn_locations = []
var directions_turned = []
var cur_dir = Vector2()
const SPEED = 32

func _ready():
	var timer = get_parent().get_node("MoveTimer")
	timer.connect("timeout", self, "_on_MoveTimer_timeout")

func add_direction(head_pos, dir):
	turn_locations.append(head_pos)
	directions_turned.append(dir)
	
func _on_MoveTimer_timeout():
	if(turn_locations.size() > 0):
		if(position == turn_locations[0]):
			cur_dir = directions_turned[0]
			directions_turned.pop_front()
			turn_locations.pop_front()
	position += cur_dir *  SPEED
