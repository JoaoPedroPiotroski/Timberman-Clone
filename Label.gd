extends Label

func _ready():
	Global.connect("score_changed", self, 'update_score')
	
func update_score():
	text = String(Global.score)
