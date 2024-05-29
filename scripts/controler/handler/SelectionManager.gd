extends Node3D

func _ready():
	# Connecte tous les signaux de sélection des unités existantes
	for unit in get_tree().get_nodes_in_group("selectable_units"):
		if unit.has_method("_on_unit_selected"):
			unit.connect("unit_selected", Callable (self, "_on_unit_selected"))
	# Connecte les nouvelles unités ajoutées dynamiquement
	get_tree().connect("node_added", Callable (self, "_on_node_added"))

func _on_unit_selected(unit):
	print("Unit selected:", unit.unit_name)

func _on_node_added(node):
	if node.is_in_group("selectable_units"):
		if node.has_method("_on_unit_selected"):
			node.connect("unit_selected", Callable (self, "_on_unit_selected"))
