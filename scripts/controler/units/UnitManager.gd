extends Node

func _ready():
	# Load the knight scene
	var knight_scene = load("res://scenes/units/KnightScene.tscn")
	
	# Instantiate the knight scene
	var knight_instance = knight_scene.instantiate()

	# Access the Knight script to retrieve stats
	if knight_instance.has_method("get_speed"):
		var knight_speed = knight_instance.get_speed()
		print("Knight's speed: ", knight_speed)
	else:
		print("The 'get_speed' method is not implemented in the knight script.")
