extends CanvasLayer

@export var clicker : Clicker

var save_loc = "user://count.save"
#var count := clicker.number 

var count : = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_2_pressed():
	on_load()

func _on_back_pressed():
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_check_button_toggled(toggled_on):
	pass # Replace with function body.
	if toggled_on:
		print("Sound is on")
	else:
		print("Sound is off")


func on_save():
	var file = FileAccess.open(save_loc,FileAccess.WRITE)
	file.store_var(count)
	print("Saved ", count)

func on_load():
	if FileAccess.file_exists(save_loc):
		var file = FileAccess.open(save_loc,FileAccess.READ)
		count = file.get_var(count)
		print("Save found ", count)
	
	else:
		print("No save file found")
		count = 0


func _on_main_menu_pressed():
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
