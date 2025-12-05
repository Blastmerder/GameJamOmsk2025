extends NodeState

@export var player: Player
@export var animatedSprite2d: AnimatedSprite2D 

func _on_process(_delta : float) -> void:
	pass 

func _on_physics_process(_delta : float) -> void:
	if player.player_direction == Vector2.LEFT:
		animatedSprite2d.play("idle_left")
	elif player.player_direction == Vector2.RIGHT:
		animatedSprite2d.play("idle_right")
	elif player.player_direction == Vector2.UP:
		animatedSprite2d.play("idle_up")
	elif player.player_direction == Vector2.DOWN:
		animatedSprite2d.play("idle_down")
	else:
		animatedSprite2d.play("idle_down")


func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input() and not player.player_in_dialogue:
		transition.emit("Walk")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animatedSprite2d.stop()
