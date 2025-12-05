class_name HurtComponent
extends Area2D

signal on_hurt
@export var is_player: bool = false

func _on_area_entered(area: Area2D) -> void:
	var hit_component = area as HitComponent
	if !hit_component.is_owner_player == is_player:
		on_hurt.emit(hit_component.hit_damage)
