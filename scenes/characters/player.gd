extends CharacterBody2D
class_name Player

var player_direction: Vector2 = Vector2.ZERO
var player_in_dialogue: bool = false

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent
@onready var sprite_2d: Sprite2D = $Sprite2D
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

func _on_reload_finished():
	print("timer")
	can_shoot = true


func on_hurt(hit_damage):
	damage_component.apply_damage(hit_damage)

func on_max_damage_reached():
	print("Ops! You Die!")
