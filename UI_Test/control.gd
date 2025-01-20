extends Control

@onready var label: Button = $VBoxContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.grab_focus()
