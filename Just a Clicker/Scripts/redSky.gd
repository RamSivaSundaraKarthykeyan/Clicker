extends Sprite2D

@export var clicker = Clicker

@onready var count : int = clicker.number

var thres : int = 6800

func _process(delta):
	disable_node()
	update_count()

func disable_node():
	if (count >= thres && is_visible_in_tree()):
		self.visible = false

func update_count():
	count = clicker.number
