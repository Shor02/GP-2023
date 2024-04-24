extends Control

func _on_Button_Death1_pressed():
	$AudioStreamPlayer.stream = load("res://sounds/sfx_deathscream_human1.wav")
	$AudioStreamPlayer.play()
func on_Button_Death2_pressed():
	$AudioStreamPlayer.stream = load("res://sounds/sfx_deathscream_human3.wav")
	$AudioStreamPlayer.play()
