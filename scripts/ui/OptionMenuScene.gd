extends Control

@onready var volume_label: Label = $VBoxContainer/MarginContainer/HBoxContainer/Volume
@onready var volume_slider: HSlider = $VBoxContainer/MarginContainer/HBoxContainer/HSlider
@onready var fullscreen_label: Label = $VBoxContainer/MarginContainer2/HBoxContainer2/Fullscreen
@onready var checkbox1: CheckBox = $VBoxContainer/MarginContainer2/HBoxContainer2/CheckBox
@onready var resolution_label: Label = $VBoxContainer/MarginContainer3/HBoxContainer3/Resolution
@onready var option_button: OptionButton = $VBoxContainer/MarginContainer3/HBoxContainer3/OptionButton
@onready var save_button: Button = $Save
@onready var cancel_button: Button = $Cancel

func _ready():
	# Connect button
	save_button.connect("pressed", Callable(self, "_on_SaveButton_pressed"))
	cancel_button.connect("pressed", Callable(self, "_on_CancelButton_pressed"))
	
	# Initial values
	volume_slider.value = 50  
	checkbox1.set_pressed(false)    
	option_button.add_item("1024x768")
	option_button.add_item("1280x720")
	option_button.add_item("1920x1080")
	option_button.selected = 1 

func _on_SaveButton_pressed():
	# Save
	var volume = volume_slider.value
	var fullscreen = checkbox1.pressed
	var resolution = option_button.get_selected_id()
	
	print("Settings Saved: Volume - %d, Fullscreen - %s, Resolution - %d" % [volume, fullscreen, resolution])

func _on_CancelButton_pressed():
	print("Settings changes canceled.")
	get_tree().change_scene_to_file("res://scenes/menu/mainmenu/MainMenuScene.tscn")
