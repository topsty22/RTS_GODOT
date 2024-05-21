extends Control

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var label: Label = $Label
var load_progress: int = 0


func _ready():
	# Progressbar and label
	progress_bar.value = 0
	label.text = "Chargement : 0%"
	
	# Loading
	start_loading()

# Function loading
func start_loading():
	# Simulate loading with timer (replace with assets)
	var timer: Timer = Timer.new()
	timer.wait_time = 0.1
	timer.connect("timeout", Callable(self, "_on_Timer_timeout"))
	add_child(timer)
	timer.start()

# Function called when times out
func _on_Timer_timeout() -> void:
	if load_progress < 100:
		load_progress += 10  # Simulate progress
		progress_bar.value = load_progress
		label.text = "Chargement : " + str(load_progress) + "%"
	else:
		# Loading complete, switch to menuscene
		get_tree().change_scene_to_file("res://scenes/menu/mainmenu/MainMenuScene.tscn")
