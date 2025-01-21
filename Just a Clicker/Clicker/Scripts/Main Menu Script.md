extends Control

class_name MainMenu

@onready var click_sound = $ClickSound

var sound_on : bool

func _ready():
	show()
	set_process_input(true)
	set_process(true)
	get_tree().paused = false
	_on_check_button_toggled(true)

func _on_click_pressed():
	if(sound_on):
		click_sound.play()
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_exit_pressed():
	if get_tree():
		get_tree().quit()
	if (sound_on):
		click_sound.play()

func _on_check_button_toggled(toggled_on):
	if(toggled_on):
		sound_on = true
	else:
		sound_on = false
