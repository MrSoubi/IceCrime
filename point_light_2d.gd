extends PointLight2D

var starting_position : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	starting_position = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	texture_scale = clamp(texture_scale + randf_range(-0.005, 0.005), 0.18, 0.22)
	energy = clamp(energy + randf_range(-0.001, 0.001), 1.8, 2.2)
