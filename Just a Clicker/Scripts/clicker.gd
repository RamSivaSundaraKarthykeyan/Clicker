extends Label

class_name ActualClicker

@onready var anim = $"../../AnimatedSprite2D"
@onready var click_sound = $"../../../../ClickSound"

var save_loc = "user://count.save"
var sound_on : bool = true

var number : int 

func _process(delta):
	on_click()
	on_reset(delta)
	on_save()
	on_load()
	end()
	on_mute()

func animationPlay():
	anim.play("Click")

func end():
	pass
	#if number == 10000:
	#	get_tree().quit()

func on_click():
	if Input.is_action_just_pressed("click"):
		number += 1
		animationPlay()
		if sound_on:
			click_sound.play()
	if Input.is_action_pressed("Space"):
		number = number + (2*1)
		animationPlay()
		if sound_on:
			click_sound.play()
	self.text = str(number)

func on_reset(delta):
	if (Input.is_action_pressed("reset")):
		number -= delta

func on_save():
	if (Input.is_action_just_pressed("save")): 
		var file = FileAccess.open(save_loc,FileAccess.WRITE)
		file.store_var(number)

func on_load():
	if (Input.is_action_just_pressed("load")):
		if FileAccess.file_exists(save_loc):
			var file = FileAccess.open(save_loc,FileAccess.READ)
			number = file.get_var(number)
		
		else:
			number = 0

func on_mute():
	if (Input.is_action_just_pressed("mute")):
		sound_on = !sound_on
