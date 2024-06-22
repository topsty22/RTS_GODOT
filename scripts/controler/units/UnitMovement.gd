extends Node

var target_position = Vector3()
var speed = 0.0
var is_moving = false

func _ready():
	speed = get_parent().get_node("Stats").get("speed")  # Obtenir la vitesse définie dans UnitStats.gd

func _process(_delta):
	if is_moving:
		var unit = get_parent()
		var direction = (target_position - unit.global_transform.origin).normalized()
		unit.move_and_slide(direction * speed)

		if unit.global_transform.origin.distance_to(target_position) < 0.1:
			is_moving = false

func move_to_position(position):
	target_position = position
	is_moving = true
