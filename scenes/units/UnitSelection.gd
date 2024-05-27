extends Node

signal unit_selected(unit)

func _ready():
	set_process(true)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if is_mouse_over():
			emit_signal("unit_selected", get_parent())

func is_mouse_over():
	var viewport = get_viewport()
	var mouse_pos = viewport.get_mouse_position()
	var space_state = get_parent().get_world().direct_space_state
	var result = space_state.intersect_ray(viewport.get_camera().project_ray_origin(mouse_pos), viewport.get_camera().project_ray_normal(mouse_pos) * 1000)
	return result and result.collider == get_parent()
