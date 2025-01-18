@tool
class_name Achievement
extends Resource

signal unlocked(achievement : Achievement)

@export var name : String
@export_multiline var description : String
@export var sprite : ImageTexture
@export var conditions : Array[Condition]

func initialize() -> void:
	for condition in conditions:
		condition.initialize()
		condition.changed.connect(check_conditions)

func check_conditions():
	var all_conditions_are_met : bool = true
	
	for condition in conditions:
		all_conditions_are_met = all_conditions_are_met and condition.is_condition_met
	
	if all_conditions_are_met:
		unlocked.emit(self)
