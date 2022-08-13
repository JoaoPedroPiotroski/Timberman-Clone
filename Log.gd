extends Sprite

export(int) var step = 30
export(int) var max_pos = 190

var last_dir = 'right'
var dir
var current = false

func _init():
	var dirs = ['left', 'right']
	dirs.shuffle()
	dir = dirs[0]
	
func _ready():
	get_node(dir).visible = true

func do_step(input_dir):
	position.y += step
	material.set_shader_param('shader_param/offset', position.y)
	if current:
			
		if input_dir == dir:
			Global.lost = true
		elif input_dir != dir and input_dir != 'none':
			Global.score += 1
	if position.y > max_pos:
		queue_free()
	if position.y == 120:
		current = true
	else:
		current = false
	if position.y == 150:
		$right.visible = false
		$left.visible = false
	last_dir = input_dir
