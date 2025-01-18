class_name BoolCondition
extends Condition

@export var dynamic_value : DynamicBool
@export var target_value : bool

enum BoolComparator{
	EQUAL,
	NOT_EQUAL
}

@export var comparator : BoolComparator

func initialize() -> void:
	dynamic_value.changed.connect(check_condition)

func check_condition():
	match comparator:
		BoolComparator.EQUAL:
			is_condition_met = dynamic_value.value == target_value
		BoolComparator.NOT_EQUAL:
			is_condition_met = dynamic_value.value != target_value
	
	changed.emit()
