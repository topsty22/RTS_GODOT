extends Control

@onready var start_button: Button = $VBoxContainer/StartButton
@onready var option_button: Button = $VBoxContainer/OptionButton
@onready var credit_button: Button = $VBoxContainer/CreditButton
@onready var quit_button: Button = $VBoxContainer/QuitButton

func _ready():
	start_button.connect("pressed", Callable(self, "_on_StartButton_pressed"))
	option_button.connect("pressed", Callable(self, "_on_OptionButton_pressed"))
	credit_button.connect("pressed", Callable(self, "_on_CreditButton_pressed"))
	quit_button.connect("pressed", Callable(self, "_on_QuitButton_pressed"))

func _on_StartButton_pressed():
	print("Start button pressed")

func _on_OptionButton_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/optionmenu/OptionMenuScene.tscn")

func _on_CreditButton_pressed():
	print("Credits button pressed")

func _on_QuitButton_pressed():
	print("Quit button pressed")
