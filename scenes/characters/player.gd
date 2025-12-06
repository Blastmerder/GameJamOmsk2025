extends CharacterBody2D
class_name Player


var player_direction: Vector2 = Vector2.ZERO
var player_in_dialogue: bool = false

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent


func _ready() -> void:
	hurt_component.on_hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)

func on_hurt(hit_damage):
	damage_component.apply_damage(hit_damage)

func on_max_damage_reached():
	print("Ops! You Die!")

func _on_attack() -> void:
	$StateMachine/AttackIdle._on_attack(direct(), global_position)
func direct():
	var direction_to_mouse = get_local_mouse_position().normalized() #расчет направления для пули (текущего узла до мыши)
	return direction_to_mouse
