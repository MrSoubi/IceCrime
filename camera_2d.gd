extends Camera2D

@export var speed : float = 1

func _process(delta: float) -> void:
	if (Input.is_key_pressed(KEY_LEFT)):
		position.x -= speed * delta
	if (Input.is_key_pressed(KEY_RIGHT)):
		position.x += speed * delta
	if (Input.is_key_pressed(KEY_UP)):
		position.y -= speed * delta
	if (Input.is_key_pressed(KEY_DOWN)):
		position.y += speed * delta
