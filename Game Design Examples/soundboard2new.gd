extends Node2D

# Preloaded sounds
var sound1 = preload("res://sounds/sfx_deathscream_human1.wav")
var sound2 = preload("res://sounds/sfx_deathscream_human3.wav")
var sound3 = preload("res://sounds/sfx_deathscream_human12.wav")
var samples:Array
var players:Array
var pads:Dictionary
@export var path_str = "res://samples" 
@export var pad_scene:PackedScene
@export var note_scene:PackedScene

@export var num_pads = 8

var num_players = 10

# Signal to play sound
signal play_sound

func _ready():
	# Create buttons
	var audio_files = ["sound1", "sound2", "sound3"]
	for audio_file in audio_files:
		var button = Button.new()
		button.text = audio_file
		$VBoxContainer.add_child(button)

func _on_button_pressed(audio_file):
	# Emit the play_sound signal with the corresponding audio stream
	match audio_file:
		"sound1":
			emit_signal("play_sound", sound1)
			print("OOGLYBOOGLY")
		"sound2":
			emit_signal("play_sound", sound2)
		"sound3":
			emit_signal("play_sound", sound3)
			print("OOGLYBOOGLY")


func _on_play_sound():
	pass # Replace with function body.
	
func load_samples():
	var dir = DirAccess.open(path_str)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		
		# From https://forum.godotengine.org/t/loading-an-ogg-or-wav-file-from-res-sfx-in-gdscript/28243/2
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			if file_name.ends_with('.wav.import'):			
				file_name = file_name.left(len(file_name) - len('.import'))
				# var asp = AudioStreamPlayer.new()
				# asp.set_stream(load(SOUND_DIR + '/' + filename))
				# add_child(asp)
				# var arr = file_name.split('/')
				# var name = arr[arr.size()-1].split('.')[0]
				# samples[name] = asp
			
				var stream = load(path_str + "/" + file_name)
				stream.resource_name = file_name
				samples.push_back(stream)
				# $AudioStreamPlayer.play()
				# break
			file_name = dir.get_next()	
