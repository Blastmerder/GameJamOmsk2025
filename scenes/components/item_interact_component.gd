extends Node2D
@onready var interactable_component: InteractableComponent = $InteractableComponent
@onready var interactble_item_component: Control = $InteractbleItemComponent

func _on_interactable_component_interactable_deactivated() -> void:
	interactble_item_component.hide()
	print("deactivated")

func _on_interactable_component_interactable_activated() -> void:
	interactble_item_component.show()
	print("activated")



@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


#func _ready() -> void:
#	interactable_component.interactable_activated.connect(on_interactable_activated)
#	interactable_component.interactable_deactivated.connect(on_interactable_deactivated)
