extends ColorRect

func _ready():
	Global.connect("lost", self, 'start')
	material.set_shader_param('r_displacement', Vector2.ZERO)
	material.set_shader_param('g_displacement', Vector2.ZERO)
	material.set_shader_param('b_displacement', Vector2.ZERO)
	
func start():
	material.set_shader_param('r_displacement', Vector2(4, 0))
	material.set_shader_param('g_displacement', Vector2(0, -4))
	material.set_shader_param('b_displacement', Vector2(2, 0))
