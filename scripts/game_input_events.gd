class_name GameInputEvents

static var direction: Vector2

static var disable_input: bool
func _on_disable_input() -> void:
	disable_input = true


static func movement_input() -> Vector2:
	direction = Vector2.ZERO
	if Input.is_action_pressed("walk_left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("walk_right"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("walk_up"):
		direction += Vector2.UP
	if Input.is_action_pressed("walk_down"):
		direction += Vector2.DOWN
	print(direction)
	if disable_input:
		return Vector2.ZERO
	return direction.normalized()

static func is_movement_input() -> bool:
	if direction == Vector2.ZERO:
		return false
	return true
