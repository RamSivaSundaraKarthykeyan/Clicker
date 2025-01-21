`extends Control`

`@export var game_manager : GameManager`


`func _ready():`
	`hide()`
	`game_manager.connect("toggle_game_paused", _on_game_manager_toggle_game_paused)`


`func _process(delta):`
	`pass`

`func _on_game_manager_toggle_game_paused(is_paused: bool):`
	`if(is_paused):`
		`show()`
	`else:`
		`hide()`


`func _on_button_pressed():`
	`pass # Replace with function body.`


`func _on_resume_pressed():`
	`game_manager.game_paused = false`


`func _on_exit_pressed():`
	`get_tree().quit()`



[[get, set]]




extends CanvasLayer

class_name PauseMenu

@export var game_manager : GameManager

func _ready():
	hide()
	game_manager.connect("toggle_game_paused", _on_game_manager_toggle_game_paused)

func _process(delta):
	pass

func _on_game_manager_toggle_game_paused(is_paused: bool):
	if(is_paused):
		show()
	else:
		hide()

func cleanup_scene():
	for child in get_children():
		child.queue_free()

func _on_resume_pressed():
	game_manager.game_paused = false

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
#	get_tree().get_current_scene().queue_free()
	cleanup_scene()
