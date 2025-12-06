extends Area2D

@export var speed := 500.0
var direction: Vector2 = Vector2.ZERO

func _process(delta):
	if direction != Vector2.ZERO:
		position += direction * speed * delta
