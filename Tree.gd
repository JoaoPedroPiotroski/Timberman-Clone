extends Node2D

var l := "res://Log.tscn"
signal button_pressed
var last_dir = 'right'

func _ready():
	for _i in range(7):
		get_tree().call_group('Log', 'do_step', 'none')
		var n = load(l).instance()
		$Logs.add_child(n) 
		n.global_position = $Spawning.global_position
		Global.score = 0

func _input(event):
	print('aa')
	print(Global.lost)
	if Global.lost:
		return
	if Input.is_action_just_pressed("ui_left"):
		_on_Button_pressed('left')
	elif Input.is_action_just_pressed("ui_right"):
		_on_Button_pressed('right')
	print('bb')

func _on_Button_pressed(dir):
	if dir == 'time':
		dir = last_dir
	get_tree().call_group('Log', 'do_step', dir)
	var n = load(l).instance()
	$Logs.add_child(n) 
	n.global_position = $Spawning.global_position
	emit_signal("button_pressed", dir) 
	last_dir = dir
