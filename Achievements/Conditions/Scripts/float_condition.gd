class_name FloatCondition
extends Condition

@export var dynamic_value : DynamicFloat
@export var target_value : float

enum FloatComparator{
	EQUAL,
	GREATER,
	LOWER,
	GREATER_OR_EQUAL,
	LOWER_OR_EQUAL,
	NOT_EQUAL
}

@export var comparator : FloatComparator

func initialize() -> void:
	dynamic_value.changed.connect(check_condition)

func check_condition():
	match comparator:
		FloatComparator.EQUAL:
			is_condition_met = is_equal_approx(dynamic_value.value, target_value)
		FloatComparator.GREATER:
			is_condition_met = dynamic_value.value > target_value
		FloatComparator.GREATER_OR_EQUAL:
			is_condition_met = dynamic_value.value >= target_value
		FloatComparator.LOWER:
			is_condition_met = dynamic_value.value < target_value
		FloatComparator.LOWER_OR_EQUAL:
			is_condition_met = dynamic_value.value <= target_value
		FloatComparator.NOT_EQUAL:
			is_condition_met = not is_equal_approx(dynamic_value.value, target_value)
	
	changed.emit()
