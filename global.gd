extends Node

var bgcolor = Color('427797')
var lost = false setget set_lost
var score = 0 setget set_score
var new_his = false
var high_score = 0 setget set_hs

signal score_changed
signal lost
signal new_hs

func _ready():
	OS.window_position = Vector2(OS.get_screen_size().x / 4, 0)
	VisualServer.set_default_clear_color(bgcolor)

func set_score(new_score):
	score = new_score
	if score > high_score:
		set_hs(score)
	emit_signal("score_changed")
	
func set_hs(new_hs):
	high_score = new_hs
	new_his = true
	emit_signal("new_hs")
	
func set_lost(new_value):
	lost = new_value
	emit_signal('lost')

func restart():
	new_his = false
	score = 0
	lost = false
	AudioManager.mus_state = 'intro'
	AudioManager.play_music()
	get_tree().reload_current_scene()
	
