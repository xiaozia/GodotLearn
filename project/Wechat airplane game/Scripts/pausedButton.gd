extends TextureButton

var paused = false

var paused_1 = preload("res://Assets/image/pause.png")
var paused_2 = preload("res://Assets/image/pause_2.png")
var start_1 = preload("res://Assets/image/start.png")
var start_2 = preload("res://Assets/image/start_2.png")

func _physics_process(delta):
	raise()

func _on_pausedButton_pressed():
	if paused:
		paused = false
		texture_hover = paused_2
		texture_normal = paused_1
		get_tree().paused = false
	else:
		paused = true
		texture_hover = start_2
		texture_normal = start_1
		get_tree().paused = true
