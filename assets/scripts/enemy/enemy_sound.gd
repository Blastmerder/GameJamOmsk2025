extends Node
@onready var audio_walk: AudioStreamPlayer2D = $Walk_soind

# Called when the node enters the scene tree for the first time.
func enemy_walk() -> void:
	if !audio_walk.playing:
		audio_walk.play()
