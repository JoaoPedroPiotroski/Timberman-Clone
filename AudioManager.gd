extends Node

var mus_state = 'intro'
var current_song

export(AudioStreamSample) var intro
export(AudioStreamSample) var loop
export(AudioStreamSample) var end

onready var music_player = $Music/MusicPlayer

func _ready():
	play_music()

func play_music():
	if mus_state == 'intro':
		music_player.stream = intro
		music_player.play()
	if mus_state == 'loop':
		music_player.stream = loop
		music_player.play()
	if mus_state == 'end':
		music_player.stream = end
		music_player.play()

func play_fx(audio : String):
	for player in $Effects.get_children():
		if not player.playing:
			player.stream = load(audio)
			player.play()
			return

func outro_music():
	mus_state = 'end'
	play_music()

func stop_music():
	mus_state = 'intro'
	music_player.stream = null
	music_player.stop()

func _on_MusicPlayer_finished():
	if mus_state == 'intro':
		mus_state = 'loop'
		play_music()
	elif mus_state == 'loop':
		play_music()
	if mus_state == 'end':
		stop_music()
