# PauseMenu.gd
extends Control

signal resumed
signal settings_opened
signal main_menu_requested

@onready var resume_button: Button = $Panel/VBoxContainer/ResumeButton
@onready var main_menu_button: Button = $Panel/VBoxContainer/MainMenuButton
@onready var quit_button: Button = $Panel/VBoxContainer/QuitButton

func _ready():
	
	# Подключаем сигналы
	resume_button.pressed.connect(_on_resume_pressed)
	main_menu_button.pressed.connect(_on_main_menu_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	
	# Устанавливаем фокус
	resume_button.grab_focus()
	
	# Делаем паузу в игре
	# get_tree().paused = true
	size = get_viewport().size
	
func _on_resume_pressed():
	get_tree().paused = false
	resumed.emit()
	queue_free()

func _on_main_menu_pressed():
	get_tree().paused = false
	main_menu_requested.emit()
	get_tree().change_scene_to_file("res://scenes/controls/MainMenu.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") or event.is_action_pressed("pause"):
		_on_resume_pressed()
