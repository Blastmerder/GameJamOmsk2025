extends CharacterBody2D
class_name Player


var player_direction: Vector2 = Vector2.ZERO
var player_in_dialogue: bool = false

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var bullet_scene: PackedScene
@export var current_tool: DataTypes.Guns = DataTypes.Guns.Pistol

signal fire_sound

var t = Timer.new()
var can_shoot = true

func _ready() -> void:
	hurt_component.on_hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)
	
	t.wait_time = 1

	t.one_shot = true
	t.autostart = true
	add_child(t)
	t.connect("timeout", Callable(self, "_on_reload_finished"))
	t.start()

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if can_shoot and Input.is_action_pressed("attack"):
		t.start()
		can_shoot = false
		fire_sound.emit()
		_on_attack(direct())
		# Here creating bullet
		# For current logic of gun, use current_tool and compare with DataTypes

func _on_reload_finished():
	print("timer")
	can_shoot = true


func on_hurt(hit_damage):
	damage_component.apply_damage(hit_damage)


func on_max_damage_reached():
	print("Ops! You Die!")


func _on_attack(direction) -> void:
	var bullet = bullet_scene.instantiate()
	bullet.rotation = direction.angle()
	bullet.position = position + 50 * direction #50 * direct смешение от центра игрока direct нормализован
	bullet.direction = direction
	get_tree().current_scene.add_child(bullet)
	
	
func direct():
	var direction_to_mouse = global_position.direction_to(get_global_mouse_position()) #расчет направления для пули (текущего узла до мыши)
	return direction_to_mouse
