class_name DynamicBool
extends DynamicVariable

var value : bool :
	set(new_value):
		value = new_value
		changed.emit()
