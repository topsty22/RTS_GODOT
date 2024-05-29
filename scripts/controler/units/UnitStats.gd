extends Node

var damage = 0
var armor = 0
var speed = 0.0

func _ready():
	pass

func get_damage():
	return damage

func get_armor():
	return armor

func get_speed():
	return speed

func set_damage(value):
	damage = value

func set_armor(value):
	armor = value

func set_speed(value):
	speed = value
