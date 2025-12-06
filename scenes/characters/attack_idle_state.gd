extends NodeState

@export var bullet_scene: PackedScene
@export var player: Player
@export var animatedSprite2d: AnimatedSprite2D 
@export var hitbox: CollisionShape2D

func _on_attack(direct, position) -> void:
	var bullet = bullet_scene.instantiate()
	bullet.rotation = direct.angle()
	bullet.position = position
	bullet.direction = direct
	get_tree().current_scene.add_child(bullet)



func _on_physics_process(_delta : float) -> void:
	hitbox.disabled = true


func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	if !animatedSprite2d.is_playing():
		transition.emit("Idle")
		if GameInputEvents.is_movement_input() and not player.player_in_dialogue:
			transition.emit("Walk")
	else:
		if GameInputEvents.is_movement_input() and not player.player_in_dialogue:
			transition.emit("AttackWalk")


func _on_enter() -> void:
	hitbox.disabled = false
	animatedSprite2d.play("attack")


func _on_exit() -> void:
	hitbox.disabled = true
