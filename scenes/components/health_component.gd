extends NodeState

@export var player: Player
@export var animatedSprite2d: AnimatedSprite2D 

@export var max_health: int = 100
var health:int

signal disable_input

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health

func get_damage(damage) -> void:
	health -= damage
	if health <= 0:
		disable_input.emit()
		animatedSprite2d.play("die")
