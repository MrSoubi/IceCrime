extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $Sprite2D

@export var SPEED = 30.0
@export var JUMP_VELOCITY = -400.0

var frames_since_last_on_ground : int

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
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
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
