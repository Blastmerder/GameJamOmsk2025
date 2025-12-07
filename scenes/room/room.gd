extends Node2D

@onready var layer := $TileMap/Layer0
@export var width: int = 16
@export var height: int = 16

func _ready():
	for x in width:
		for y in height:
			layer.set_cell(Vector2i(x, y), 0)
