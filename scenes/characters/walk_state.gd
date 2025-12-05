extends NodeState

@export var player: Player
@export var animatedSprite2d: AnimatedSprite2D 
@export var speed: int = 5000
@export var hitbox: CollisionShape2D

func _on_process(_delta : float) -> void:
	pass 

func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	
	if Input.is_action_pressed("walk_left"):
		animatedSprite2d.play("walk_left")
	elif Input.is_action_pressed("walk_right"):
		animatedSprite2d.play("walk_right")
	elif Input.is_action_pressed("walk_up"):
		animatedSprite2d.play("walk_up")
	elif Input.is_action_pressed("walk_down"):
		animatedSprite2d.play("walk_down")
	
	if direction != Vector2.ZERO:
		player.player_direction = direction
	# 
	hitbox.position.x = player.player_direction[0] * 26
	hitbox.position.y = (1 - player.player_direction[1]) * -50
	
	player.velocity = direction * speed * _delta
	player.move_and_slide()


func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if !GameInputEvents.is_movement_input() or player.player_in_dialogue:
		transition.emit("Idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animatedSprite2d.stop()
