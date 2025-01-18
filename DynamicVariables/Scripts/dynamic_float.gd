class_name DynamicFloat
extends DynamicVariable

var value : float :
	set(new_value):
		value = new_value
		changed.emit()
