extends Node2D

# Preloaded sounds
var sound1 = preload("res://sounds/sfx_deathscream_human1.wav")
var sound2 = preload("res://sounds/sfx_deathscream_human3.wav")
var sound3 = preload("res://sounds/sfx_deathscream_human12.wav")

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
