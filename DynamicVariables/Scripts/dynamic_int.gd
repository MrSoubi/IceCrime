class_name DynamicInt
extends DynamicVariable

var value : int :
	set(new_value):
		value = new_value
		changed.emit()
