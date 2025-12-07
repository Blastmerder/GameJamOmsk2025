extends Node2D

@export var room_scene: PackedScene
@export var corridor_scene: PackedScene

@export var room_width: int = 16
@export var room_height: int = 16
@export var rooms_count: int = 5

@export var corridor_texture: Texture2D

var rooms: Array = []

func _ready():
	generate_level()

func generate_level():
	for i in range(rooms_count):
		var room = room_scene.instantiate()
		room.position = Vector2(randi_range(-300,300), randi_range(-300,300))
		room.width = room_width
		room.height = room_height
		add_child(room)
		rooms.append(room)

	connect_rooms_with_corridors()

func connect_rooms_with_corridors():
	for i in range(rooms.size() - 1):
		var a = rooms[i]
		var b = rooms[i+1]
		create_corridor(a.global_position, b.global_position)

func create_corridor(a: Vector2, b: Vector2):
	var corridor = corridor_scene.instantiate()
	corridor.setup(a, b, corridor_texture)
	add_child(corridor)
