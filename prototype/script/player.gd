extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -700.0
const MAX_JUMPS = 2  # Allows double jump (2 jumps total)

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var gravity = 980
var jump_count = 0  # Track the number of jumps

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jump_count = 0  # Reset jump count when on the floor

	# Handle Jump and Double Jump
	if Input.is_action_just_pressed("ui_accept") and jump_count < MAX_JUMPS:
		velocity.y = JUMP_VELOCITY
		jump_count += 1  # Increase jump count
		animated_sprite_2d.play("jump")  # Play jump animation

	# Handle Left and Right Movement
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite_2d.flip_h = direction < 0  # Flip sprite when moving left
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Handle animations
	if is_on_floor():
		if direction:  
			animated_sprite_2d.play("run")  # Play run animation if moving
		else:
			animated_sprite_2d.play("idle")  # Play idle animation when standing still
	else:
		if velocity.y > 0:
			animated_sprite_2d.play("fall")  # Falling animation

	move_and_slide()
