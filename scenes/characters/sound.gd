extends Node

@onready var audio_fire: AudioStreamPlayer2D = $Fire_sound
@onready var audio_walk1: AudioStreamPlayer2D = $Walk_sound1
@onready var audio_walk2: AudioStreamPlayer2D = $Walk_sound2
@onready var audio_walk3: AudioStreamPlayer2D = $Walk_sound3
@onready var audio_walk_stop: AudioStreamPlayer2D = $Walk_stop_sound
var audio_walk_list = []

func _ready() -> void:
	audio_walk_list.append_array([audio_walk1, audio_walk2, audio_walk3])

func _on_fire_sound() -> void:
	audio_fire.play()


func _on_walk_walk_sound() -> void:
	if !audio_walk1.playing and !audio_walk2.playing and !audio_walk3.playing:
		audio_walk_list.pick_random().play()
		print(audio_walk_list.pick_random())


func _on_walk_sound_stop() -> void:
	audio_walk1.stop()
	audio_walk2.stop()
	audio_walk3.stop()
	audio_walk_stop.play()
