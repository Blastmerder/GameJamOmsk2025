class_name DamageComponent
extends Node2D

@export var max_damage = 1
@export var current_damage = 0

signal max_damage_reached

func apply_damage(damage: int) -> void:
	current_damage = clamp(current_damage + damage, 0, max_damage)
	
	if current_damage == max_damage:
		max_damage_reached.emit()
	
