extends Control

@onready var cancel_button: Button = $VBoxContainer/Cancel

func _ready():
	cancel_button.connect("pressed", Callable(self, "_on_CancelButton_pressed"))

func _on_CancelButton_pressed():
	print("Settings changes canceled.")
	get_tree().change_scene_to_file("res://scenes/menu/mainmenu/MainMenuScene.tscn")
