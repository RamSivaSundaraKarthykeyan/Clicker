
**Version 1:**
`extends Node`

`var number : int = 0`

`func _process(delta):`
	`if Input.is_action_pressed("Space"):
		`number += 1`
	`print(number)`



**Version 2**:
`extends Node

`var number : int = 0`

`func _process(delta):`
	`if Input.is_action_pressed("Space"):`
		`number += 1
	`self.text = str(number)

In ***version 2*** the script is attached to the ***label*** node (Control -> Label)
But there was a problem, the **number just kept increasing** even the button was kept holding 
so I alternatively tried **is_action_just_pressed()** 



**Version 3:**

`extends Node`

`var number : int = 0`

`func _process(delta):`
	`if Input.is_action_just_pressed("Space") || Input.is_action_just_pressed("click"):`
		`number += 1`
	`self.text = str(number)`

   **Explanation:**
    | | - OR operator to use both Space and click as inputs
    
    [[self]]
    [[Label]]



**Version 4**:

`extends Label`

`var number : int = 0`

`func _process(delta):`
	`if Input.is_action_just_pressed("Space") || Input.is_action_just_pressed("click"):`
		`number += 1`
	`self.text = str(number)`

As Chat GPT suggested , extending the script to a node may cause some error if the node that this code is attached to is not a Label or a node with Label as child.

So the `extends` is converted from `Node` to `Label`.Since the script is already attached to `Label` node.


# Version 5:


extends Label

`var number : int = 0`

`func _process(delta):`
	`if Input.is_action_just_pressed("Space") || Input.is_action_just_pressed("click"):`
		`number += 1`
	`self.text = str(number)`
	
	`if (Input.is_action_pressed("reset")):`
		`number -= delta`

In this version I made some changes so that I can reduce the value of the number gradually over time.
Initially it was just
`if(Input.is_action_just_pressed("reset"):`
	`number = 0`
But then I wanted it to gradually reduce.


# Version 6:\

`extends Label`

`var number : int = 0`

`func _process(delta):`
	`on_click()`
	
	on_reset()

`func on_ready():`
	`if Input.is_action_just_pressed("Space") || Input.is_action_just_pressed("click"):`
		`number += 1`
	`self.text = str(number)`

`func on_reset():`
	`if (Input.is_action_pressed("reset")):`
		`number -= delta`


# Version 7:


`extends Label`

`save_loc = "user://count.save"`

`var number : int = 0`

`func _process(delta):`
	`on_click()`
	
	on_reset()
	
	on_save()
	
	on_load()

`func on_click():`
	`if Input.is_action_just_pressed("Space") || Input.is_action_just_pressed("click"):`
		`number += 1`
	`self.text = str(number)`

`func on_reset():`
	`if (Input.is_action_pressed("reset")):`
		`number -= delta`
\
`func on_save():`
	`var file = FileAccess.open(save_loc,FileAccess.WRITE)`
	`file.store_var(number)`
	`print("Saved")`

`func on_load():`
	`if FileAccess.file_exists(save_loc):`
		`var file = FileAccess.open(save_loc,FileAccess.READ)`
		`number = file.get_var(number)`
		`print("Save found")`
	
	else:
		print("No save file found")
		number = 0


# Version 8:

`extends Label`

`var save_loc = "user://count.save"`

`var number : int` 

`func _process(delta):`
	`on_click()`
	`on_reset(delta)`
	`on_save()`
	`on_load()`

`func on_click():`
	`if Input.is_action_just_pressed("Space") || Input.is_action_just_pressed("click"):`
		`number += 1`
	`self.text = str(number)`

`func on_reset(delta):`
	`if (Input.is_action_pressed("reset")):`
		`number -= delta`

`func on_save():`
	`if (Input.is_action_just_pressed("save")):`
		`var file = FileAccess.open(save_loc,FileAccess.WRITE)`
		`file.store_var(number)`
		`print("Saved")`

`func on_load():`
	`if (Input.is_action_just_pressed("load")):`
		`if FileAccess.file_exists(save_loc):`
			`var file = FileAccess.open(save_loc,FileAccess.READ)`
			`number = file.get_var(number)`
			`print("Save found")`
		
		else:
			print("No save file found")
			number = 0

# Version 9:
`extends Label`

`@onready var anim = $"../../AnimatedSprite2D"`

`var save_loc = "user://count.save"`

`var number : int` 

`func _process(delta):`
	`on_click()`
	`on_reset(delta)`
	`on_save()`
	`on_load()`

`func animation():`
	`anim.play("Click")`

`func on_click():`
	`if Input.is_action_just_pressed("Space") || Input.is_action_just_pressed("click"):`
		`number += 1`
		`animation()`
	`self.text = str(number)`
	

`func on_reset(delta):`
	`if (Input.is_action_pressed("reset")):`
		`number -= delta`

`func on_save():`
	`if (Input.is_action_just_pressed("save")):`
		`var file = FileAccess.open(save_loc,FileAccess.WRITE)`
		`file.store_var(number)`
		`print("Saved")`

`func on_load():`
	`if (Input.is_action_just_pressed("load")):`
		`if FileAccess.file_exists(save_loc):`
			`var file = FileAccess.open(save_loc,FileAccess.READ)`
			`number = file.get_var(number)`
			`print("Save found")`
		
		else:
			print("No save file found")
			number = 0





# Version 10:
`extends Label`

`class_name Clicker`

`@onready var anim = $"../../AnimatedSprite2D"`

`var save_loc = "user://count.save"`

`var number : int = 3397`
`var notPaused : bool = true`

`func _process(delta):`
	`on_click()`
	`on_reset(delta)`
	`on_save()`
	`on_load()`
	`end()`
	

`func animationPlay():`
	`anim.play("Click")`

`func end():`
	`pass`
	`if number == 10000:`
		`get_tree().quit()`

`func on_click():`
	`if Input.is_action_just_pressed("Space") || Input.is_action_pressed("click"):`
		`number += 1`
		`animationPlay()`
	`self.text = str(number)`
	
	

`func on_reset(delta):`
	`if (Input.is_action_pressed("reset")):`
		`number -= delta`

`func on_save():`
	`if (Input.is_action_just_pressed("save")):` 
		`var file = FileAccess.open(save_loc,FileAccess.WRITE)`
		`file.store_var(number)`
		`print("Saved")`

`func on_load():`
	`if (Input.is_action_just_pressed("load")):`
		`if FileAccess.file_exists(save_loc):`
			`var file = FileAccess.open(save_loc,FileAccess.READ)`
			`number = file.get_var(number)`
			`print("Save found")`
		
		`else:`
			`print("No save file found")`
			`number = 0`


# Final:
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
