extends RichTextLabel


var was_hs = false

func _ready():
	bbcode_text = "[center]HS: " + String(Global.high_score) + "[/center]"
	Global.connect("new_hs", self, 'update')
	
func update():
	bbcode_text = "[center]HS: " + String(Global.high_score) + "[/center]"
	if Global.new_his:
		was_hs = true
		bbcode_text = "[center][color=yellow]HS: " + String(Global.high_score) + "[/color][/center]"
