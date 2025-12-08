extends Node
signal attack

func _input(InputEvent) -> void:
	if Input.is_action_pressed("attack"):
		attack.emit()
		
