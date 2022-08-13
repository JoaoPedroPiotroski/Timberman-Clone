extends Panel



func _on_Config_pressed():
	if get_parent().get_node("Config").pressed:
		get_tree().paused = true
		show()
	else:
		get_tree().paused = false
		hide()

func _ready():
	$VBoxContainer/FXSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index('FX'))
	$VBoxContainer/MusicSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index('Music'))


func _on_FXSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('FX'), value)


func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Music'),  value)
