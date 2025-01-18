class_name IntCondition
extends Condition

@export var dynamic_value : DynamicInt
@export var target_value : int

enum IntComparator{
	EQUAL,
	GREATER,
	LOWER,
	GREATER_OR_EQUAL,
	LOWER_OR_EQUAL,
	NOT_EQUAL
}

@export var comparator : IntComparator

func initialize() -> void:
	dynamic_value.changed.connect(check_condition)

func check_condition():
	match comparator:
		IntComparator.EQUAL:
			is_condition_met = dynamic_value.value == target_value
		IntComparator.GREATER:
			is_condition_met = dynamic_value.value > target_value
		IntComparator.GREATER_OR_EQUAL:
			is_condition_met = dynamic_value.value >= target_value
		IntComparator.LOWER:
			is_condition_met = dynamic_value.value < target_value
		IntComparator.LOWER_OR_EQUAL:
			is_condition_met = dynamic_value.value <= target_value
		IntComparator.NOT_EQUAL:
			is_condition_met = dynamic_value.value != target_value
	
	changed.emit()
