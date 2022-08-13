extends Button

func _ready():
	Global.connect("lost", self, 'on_lost')
	
func on_lost():
	if Global.lost:
		disabled = true
	else: 
		disabled = false
