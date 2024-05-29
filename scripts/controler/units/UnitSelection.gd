extends Node3D

signal unit_selected

func _ready():
	set_process(true)
	add_to_group("selectable_units")

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if is_mouse_over():
			emit_signal("unit_selected")

func is_mouse_over():
	var viewport = get_viewport()
	var mouse_pos = viewport.get_mouse_position()
	var camera = viewport.get_camera_3d()
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * 1000
	var space_state = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	
	var result = space_state.intersect_ray(ray_query)
	return result and result.collider == get_parent()
