extends Button

func _ready():
	Global.connect("lost", self, 'show')

func _input(event):
	if Input.is_action_just_pressed("ui_select"):
		_on_Button_pressed()

func _on_Button_pressed():
	Global.restart()
