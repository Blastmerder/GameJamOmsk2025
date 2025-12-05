extends NodeState

@export var player: Player
@export var animatedSprite2d: AnimatedSprite2D 
@export var hitbox: CollisionShape2D

func _on_process(_delta : float) -> void:
	pass 

func _on_physics_process(_delta : float) -> void:
	animatedSprite2d.flip_h = false
	if player.player_direction == Vector2.LEFT:
		animatedSprite2d.play("idle_side")
		animatedSprite2d.flip_h = true
	elif player.player_direction == Vector2.RIGHT:
		animatedSprite2d.play("idle_side")
	elif player.player_direction == Vector2.UP:
		animatedSprite2d.play("idle_backward")
	elif player.player_direction == Vector2.DOWN:
		animatedSprite2d.play("idle_forward")
	else:
		animatedSprite2d.play("idle_forward")
	
	if Input.is_action_pressed("attack"):
		transition.emit("AttackIdle")
	

func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input() and not player.player_in_dialogue:
		transition.emit("Walk")
	
	
	if Input.is_action_pressed("attack"):
		transition.emit("AttackIdle")



func _on_enter() -> void:
	hitbox.disabled = true


func _on_exit() -> void:
	animatedSprite2d.stop()
