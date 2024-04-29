extends Button

@onready var asp = $AudioStreamPlayer

func _on_pressed():
	asp.play()
