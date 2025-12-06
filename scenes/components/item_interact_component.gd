extends Node2D
@onready var interactable_component: InteractableComponent = $InteractableComponent
@onready var interactble_item_component: Control = $InteractbleItemComponent

func _on_interactable_component_interactable_activated() -> void:
	interactble_item_component.show()


func _on_interactable_component_interactable_deactivated() -> void:
	interactble_item_component.hide()
