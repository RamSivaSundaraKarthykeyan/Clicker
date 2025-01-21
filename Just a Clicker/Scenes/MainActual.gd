extends Node2D

class_name Clicker

@export var actual_clicker : ActualClicker

# Called when the node enters the scene tree for the first time.
func _ready():
	var number : int = actual_clicker.number


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
