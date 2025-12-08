extends Control

@onready var play_button: Button = $VBoxContainer/PlayButton
@onready var quit_button: Button = $VBoxContainer/ExitButton

func _ready():
	# Подключаем сигналы
	play_button.pressed.connect(_on_play_pressed)
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

func _on_quit_pressed():
	get_tree().quit()

# Обработка клавиатуры
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		_on_quit_pressed()
