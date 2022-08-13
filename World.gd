extends Node2D


func _ready():
	Global.connect("lost", self, 'on_lost')
	
func on_lost():
	AudioManager.outro_music()
