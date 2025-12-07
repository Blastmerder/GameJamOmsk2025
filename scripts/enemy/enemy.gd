extends CharacterBody2D
class_name Enemy

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

@export var player: Player

func _ready() -> void:
	hurt_component.on_hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)
	
func _process(_delta) -> void:
	velocity = global_position.direction_to(player.position) * _delta * 10000
	move_and_slide()
	
func on_hurt(hit_damage):
	damage_component.apply_damage(hit_damage)

func on_max_damage_reached():
	queue_free()
