class_name InteractableComponent
extends Area2D

signal interactable_activated

func _on_body_entered(body: Node2D) -> void:
	print(body)
	interactable_activated.emit() 
