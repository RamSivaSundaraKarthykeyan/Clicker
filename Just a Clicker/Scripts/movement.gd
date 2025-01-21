extends Sprite2D

var mouse_velocity = Vector2.ZERO  # Tracks the velocity of the mouse
var sprite_velocity = Vector2.ZERO  # The velocity applied to the sprite
var friction = 0.7  # The friction value that controls how long the drift lasts

@onready var viewport_rect = get_viewport().get_visible_rect()

func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass

func _process(delta):
	var position = global_position
	var sprite_size = texture.get_size() * scale / 2
	
	#position.x = clamp(position.x, viewport_rect.position.x + sprite_size.x, viewport_rect.position.x + viewport_rect.size.x - sprite_size.x)
	#position.y = clamp(position.y, viewport_rect.position.y + sprite_size.y, viewport_rect.position.y + viewport_rect.size.y - sprite_size.y)
	
	global_position = position
	
	if(Input.is_action_pressed("right_mouse_button")):
		# Get the current and previous mouse positions
		var current_mouse_pos = get_global_mouse_position()
		
		# Calculate mouse velocity (mouse speed between frames)
		mouse_velocity = (current_mouse_pos - global_position)
		
		# Apply the mouse velocity to the sprite
		sprite_velocity += mouse_velocity
		
		# Apply friction to slow down the sprite gradually (drift)
		sprite_velocity *= friction
		
		# Update the sprite position based on the calculated sprite velocity
		global_position += sprite_velocity * delta
	
	
	
