extends ProgressBar
signal timeout
func _ready():
	get_parent().get_parent().get_parent().get_node("Tree").connect('button_pressed', self, 'reset')
	connect('timeout', get_parent().get_parent().get_parent().get_node("Tree"), '_on_Button_pressed')

func _process(delta):
	if Global.lost:
		return
	value += delta
	if value >= max_value:
		emit_signal('timeout', 'time')

func reset(_dir):
	value = 0
	
