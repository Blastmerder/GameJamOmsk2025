extends Node2D

var balloon_scene = preload("res://diologue/game_dialogue_balloon.tscn")
var first_time: bool = true

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactable_component: InteractableComponent = $InteractableComponent
@onready var player: Player = $"../Player"
@onready var static_body_2d: StaticBody2D = $"../StaticBody2D"


func _ready() -> void:
	interactable_component.interactable_activated.connect(on_interactable_activated)
	interactable_component.interactable_deactivated.connect(on_interactable_deactivated)
	static_body_2d.hide()
	static_body_2d.collision_layer = 2
	
	
func on_interactable_activated() -> void:
	print("activDialog")
	if first_time:
		static_body_2d.show()
		static_body_2d.collision_layer = 1
		player.player_in_dialogue = true
		first_time = false
		var balloon: BaseGameDialogueBalloon = balloon_scene.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(load("res://diologue/conversations/act1.dialogue"), "start", [self, {"player"= player}])
	
	
func on_interactable_deactivated() -> void:
	print("non")
	hide()
