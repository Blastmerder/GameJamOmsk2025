extends CharacterBody2D

@export var speed: float = 500.0
@export var damage: int = 1

var direction: Vector2 = Vector2.ZERO
@onready var interactable_component: InteractableComponent = $InteractableComponent
@onready var hit_component: HitComponent = $HitComponent

func _ready() -> void:
	interactable_component.interactable_activated.connect(on_hit)
	hit_component.hit_damage = damage

func _physics_process(_delta : float) -> void:
	velocity = direction * speed * _delta
	move_and_slide()

func on_hit() -> void:
	queue_free()
