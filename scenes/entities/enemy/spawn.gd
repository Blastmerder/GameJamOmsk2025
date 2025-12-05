extends Node

@export var Enemy: Enemy
var scene_path = ""

# Called when the node enters the scene tree for the first time.
func spawn() -> void:
	var rx = 100#rand_range(spawn_bounds_min.x, spawn_bounds_max.x)
	var ry = 100#rand_range(spawn_bounds_min.y, spawn_bounds_max.y)
	var enemy_scene = load(scene_path)
	var enemy = enemy_scene.instantiate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
