extends Node

@export var achievements : Array[Achievement]
@onready var grid_container: GridContainer = $Control/GridContainer
#const LABEL = preload("res://Achievements/label.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for achievement in achievements:
		achievement.initialize()
		#achievement.unlocked.connect(display_pop_up)

#func display_pop_up(achievement : Achievement):
#	var new_label = LABEL.instantiate()
#	add_child(new_label)
#	new_label.reparent(grid_container)
#	new_label.text = achievement.name
