extends Node

class_name GameManager

@export var main_menu : MainMenu
@export var pause_menu : PauseMenu

signal toggle_game_paused(is_paused: bool)
signal game_is_started(is_started: bool)

var game_paused: bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused", game_paused)

func _input(event: InputEvent):
	if (event.is_action_pressed("escape")):
		game_paused = !game_paused

func _ready():
	pass
