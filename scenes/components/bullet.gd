extends CharacterBody2D

@export var speed := 500.0
var direction: Vector2 = Vector2.ZERO

func _physics_process(_delta : float) -> void:
	if direction != Vector2.ZERO:
		position += direction * speed * _delta
	move_and_slide()

func _on_interactable_component_interactable_activated() -> void:
	queue_free()
