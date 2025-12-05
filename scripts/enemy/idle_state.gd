extends NodeState

@export var enemy: Enemy

func _on_process(_delta : float) -> void:
	pass 

func _on_physics_process(_delta : float) -> void:
	enemy.velocity = enemy.global_position.direction_to(enemy.player.position) * _delta * 1000
	enemy.move_and_slide()
	
func _on_next_transitions() -> void:
	pass
	
func _on_enter() -> void:
	pass

func _on_exit() -> void:
	pass
