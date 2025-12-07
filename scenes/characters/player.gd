extends CharacterBody2D
class_name Player


var player_direction: Vector2 = Vector2.ZERO
var player_in_dialogue: bool = false

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var bullet_scene: PackedScene
@export var current_tool: DataTypes.Guns = DataTypes.Guns.Pistol
@export var delay: float = 1

var t = Timer.new()
var can_shoot = true

var live_time = Timer.new()

func _ready() -> void:
	hurt_component.on_hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)
	
	t.wait_time = delay

	t.one_shot = true
	t.autostart = true
	add_child(t)
	t.connect("timeout", Callable(self, "_on_reload_finished"))
	t.start()
	
	live_time.wait_time = 60

	live_time.one_shot = true
	live_time.autostart = true
	add_child(live_time)
	live_time.connect("timeout", Callable(self, "death"))
	live_time.start()

func _process(delta: float) -> void:
	print(live_time.time_left)
	look_at(get_global_mouse_position())
	if can_shoot and Input.is_action_pressed("attack"):
		t.start()
		can_shoot = false
		_on_attack(direct())
		# Here creating bullet
		# For current logic of gun, use current_tool and compare with DataTypes

func _on_reload_finished():
	print("timer")
	can_shoot = true


func on_hurt(hit_damage):
	subtract_from_seconds(live_time, 10.0)
	damage_component.apply_damage(hit_damage)
	

func death():
	get_tree().reload_current_scene()


func on_max_damage_reached():
	print("Ops! You Die!")


func _on_attack(direction) -> void:
	var bullet = bullet_scene.instantiate()
	bullet.rotation = direction.angle()
	bullet.position = position + 75 * direction #50 * direct смешение от центра игрока direct нормализован
	bullet.direction = direction
	get_tree().current_scene.add_child(bullet)
	
	
func direct():
	var direction_to_mouse = global_position.direction_to(get_global_mouse_position()) #расчет направления для пули (текущего узла до мыши)
	return direction_to_mouse

func subtract_from_seconds(timer: Timer, sec: float) -> void:
	var remaining = timer.time_left
	var new_time = max(0.0, remaining - sec)
	timer.stop()
	timer.wait_time = new_time
	timer.start()
