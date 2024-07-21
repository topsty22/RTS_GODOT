extends Node3D

@export var tile_size = Vector3(64, 32, 16)
@export var camera_speed = 2.5  # Camera speed

# Variables
var camera: Camera3D
var drag_start_position: Vector2  # Vector2 for screen coordonates
var is_dragging: bool = false

func _ready():
	camera = $Camera/Camera3D
	camera.make_current()  # Set camera

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Store mouse position when using left button
				drag_start_position = event.position
				is_dragging = true
			else:
				# Reset drag start position when click is released
				is_dragging = false

func _process(delta):
	if is_dragging:
		# Calculate vector movement based on difference between current and start drag position
		var current_position = get_viewport().get_mouse_position()
		var drag_delta = current_position - drag_start_position

		# Convert drag delta to world coordinates
		var move_x = -drag_delta.x * delta * camera_speed
		var move_y = -drag_delta.y * delta * camera_speed

		# Move the camera in x and y direction
		camera.translate(Vector3(move_x, move_y, 0))
		
		# Update drag start position
		drag_start_position = current_position
