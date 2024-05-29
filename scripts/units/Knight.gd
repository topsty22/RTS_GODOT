extends Node3D

var speed = 10
var unit_name = "knight"

func _ready():
	add_to_group("selectable_units")

# Method to retrieve the speed variable
func get_speed():
	return speed
