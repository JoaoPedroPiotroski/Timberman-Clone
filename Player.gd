extends Node2D

var sounds = [
	"res://Assets/bfh1_breaking_03.ogg",
	"res://Assets/bfh1_wood_breaking_03.ogg",
	"res://Assets/bfh1_wood_hit_01.ogg",
	"res://Assets/bfh1_wood_hit_02.ogg"
]

func _on_Tree_button_pressed(dir):
	$AnimationPlayer.play("Swing")
	sounds.shuffle()
	AudioManager.play_fx(sounds[0])
	if dir == 'left':
		$Prepare.global_position = $Left.global_position
		$Action.global_position = $Left.global_position
		$Prepare.flip_h = true
		$Action.flip_h = true
		$Prepare.global_position.x -= 31
	if dir == 'right':
		$Prepare.global_position = $Right.global_position
		$Action.global_position = $Right.global_position
		$Prepare.flip_h = false
		$Action.flip_h = false
	$Prepare.global_position.y -= 45
	$Action.global_position.y -= 38
	$Action.global_position.x -= 16
