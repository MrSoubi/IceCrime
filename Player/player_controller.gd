extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $Sprite2D
@onready var screen_size = get_viewport_rect().size

@export var SPEED = 30.0
@export var JUMP_VELOCITY = -400.0
@export var player_id : int

var frames_since_last_on_ground : int

var jump_input : bool
var move_left_input : float
var move_right_input : float

func _input(event: InputEvent) -> void:
	if event.device != player_id: return
	
	if event.is_action_pressed("jump"): jump_input = true
	
	if event.is_action("move_left"):
		move_left_input = event.get_action_strength("move_left")
	
	if event.is_action("move_right"):
		move_right_input = event.get_action_strength("move_right")
		

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite.frame = 2
		frames_since_last_on_ground += 1
	else:
		if frames_since_last_on_ground > 0:
			sprite.frame = 0
		frames_since_last_on_ground = 0
	
	# Handle jump.
	if jump_input and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = move_right_input - move_left_input
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
	else:
		sprite.frame = 0
	
	if abs(velocity.x) > 0:
		sprite.play()
	else:
		sprite.stop()
	
	move_and_slide()
	
	print(screen_size)
	position.x = wrapf(position.x, -screen_size.x / 2, screen_size.x / 2)
	position.y = wrapf(position.y, -screen_size.y / 2, screen_size.y / 2)
	
	jump_input = false
