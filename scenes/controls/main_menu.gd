extends Control

@onready var play_button: Button = $VBoxContainer/PlayButton
@onready var settings_button: Button = $VBoxContainer/SettingsButton
@onready var quit_button: Button = $VBoxContainer/ExitButton

func _ready():
	# Подключаем сигналы
	play_button.pressed.connect(_on_play_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	
	# Настраиваем фокус
	play_button.grab_focus()
	
	# Фоновую музыку можно запустить здесь
	# $BackgroundMusic.play()

func _on_play_pressed():
	# Загружаем игровую сцену
	get_tree().change_scene_to_file("res://scenes/test_scene/Test_enemys.tscn")
	# Или скрываем меню
	# hide()

func _on_settings_pressed():
	# Загружаем меню настроек
	var settings_menu = load("res://SettingsMenu.tscn").instantiate()
	add_child(settings_menu)
	settings_menu.back_pressed.connect(_on_settings_closed)

func _on_quit_pressed():
	get_tree().quit()

func _on_settings_closed():
	# Возвращаем фокус на кнопку настроек
	settings_button.grab_focus()

# Обработка клавиатуры
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		_on_quit_pressed()
