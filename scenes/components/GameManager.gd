# GameManager.gd (добавить в автозагрузку)
extends Node

signal settings_changed

# Настройки по умолчанию
var settings = {
	"master_volume": 80,
	"music_volume": 70,
	"sfx_volume": 90,
	"fullscreen": true,
	"vsync": true,
	"language": "ru"
}

func _ready():
	load_settings()

func save_settings():
	var file = FileAccess.open("user://settings.cfg", FileAccess.WRITE)
	file.store_var(settings)
	file.close()

func load_settings():
	if FileAccess.file_exists("user://settings.cfg"):
		var file = FileAccess.open("user://settings.cfg", FileAccess.READ)
		settings = file.get_var()
		file.close()
		apply_settings()

func apply_settings():
	# Применяем настройки звука
	AudioServer.set_bus_volume_db(0, linear_to_db(settings.master_volume / 100.0))
	AudioServer.set_bus_volume_db(1, linear_to_db(settings.music_volume / 100.0))
	AudioServer.set_bus_volume_db(2, linear_to_db(settings.sfx_volume / 100.0))
	
	# Применяем графические настройки
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN 
		if settings.fullscreen else DisplayServer.WINDOW_MODE_WINDOWED)
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED 
		if settings.vsync else DisplayServer.VSYNC_DISABLED)
	
	emit_signal("settings_changed")
