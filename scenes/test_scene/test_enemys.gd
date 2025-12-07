extends Node2D

@onready var pause_menu_scene = preload("res://scenes/controls/pause_menu.tscn")

func _process(delta: float) -> void:
	if Input.is_action_pressed("pause"):
		toggle_pause()
	

func toggle_pause():
	if get_tree().paused:
		return
	
	var pause_menu = pause_menu_scene.instantiate()
	pause_menu.size
	add_child(pause_menu)
	
	pause_menu.resumed.connect(_on_resume)
	pause_menu.settings_opened.connect(_on_settings_in_pause)
	pause_menu.main_menu_requested.connect(_on_main_menu_from_pause)
	

func _on_resume():
	pass

func _on_settings_in_pause():
	pass

func _on_main_menu_from_pause():
	pass
