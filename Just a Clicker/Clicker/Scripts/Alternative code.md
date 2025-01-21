# Own written:
   Less drift and Less speed

## Program:

extends Sprite2D

var velocity = Vector2.ZERO
var speed = 4000  # You can adjust this value for desired speed
var friction = 0.9  # Determines how fast the drift slows down
var stop_threshold = 1

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	
	var distance_to_mouse = global_position.distance_to(mouse_pos)
	#print(distance_to_mouse)
	
	if(distance_to_mouse > stop_threshold):
		var direction = (mouse_pos - global_position).normalized()
		
		velocity += (direction * speed * delta)
	
	else:
		velocity = Vector2.ZERO
	
	Apply velocity to the global position
	global_position += velocity * delta
	
	Apply friction to simulate drift effect
	velocity *= friction

# Initial Script

Simple No drift and no BS , just the sprite moving in the same speed as the mouse.
## Program:

extends Sprite2D

func _process(_delta):
    global_position = get_global_mouse_position()



# Accepted

The movement is fast but the drift is very apparent which might affect the hand sprite which might be added later..

## Program:

extends Sprite2D

var mouse_velocity = Vector2.ZERO  # Tracks the velocity of the mouse
var sprite_velocity = Vector2.ZERO  # The velocity applied to the sprite
var friction = 0.9  # The friction value that controls how long the drift lasts

func _process(delta):
	# Get the current and previous mouse positions
	var current_mouse_pos = get_global_mouse_position()
	
	# Calculate mouse velocity (mouse speed between frames)
	mouse_velocity = current_mouse_pos - global_position
	
	# Apply the mouse velocity to the sprite
	sprite_velocity += mouse_velocity
	
	# Apply friction to slow down the sprite gradually (drift)
	sprite_velocity *= friction
	
	# Update the sprite position based on the calculated sprite velocity
	global_position += sprite_velocity * delta
