extends Node2D

@export var tile_size = Vector2(64, 32)
@export var camera_speed = 2.0  # Adjust the camera movement speed as needed

# Variables
var camera: Camera2D
var tilemap: TileMap
var drag_start_position: Vector2

func _ready():
	# Initialize the Camera2D node
	camera = $Camera2D
	camera.make_current()  # Set the camera as the current one
	camera.zoom = Vector2(1, 1)  # Adjust zoom level if necessary

	# Initialize the TileMap node
	tilemap = $TileMap

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Store the mouse position when left button is pressed
				drag_start_position = get_viewport().get_mouse_position()
			elif event.button_mask == 0:  # Check if no buttons are pressed (button released)
				drag_start_position = Vector2.ZERO  # Reset drag start position

func _process(delta):
	# Check if the left mouse button is being held down
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		# Calculate the movement vector based on the difference between current and start drag positions
		var drag_delta = get_viewport().get_mouse_position() - drag_start_position

		# Adjust the camera position based on the drag delta
		camera.offset -= drag_delta * delta * camera_speed
