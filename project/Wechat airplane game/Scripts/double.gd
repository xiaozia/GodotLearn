extends Area2D

var run = true

func _physics_process(delta):
	position.y += 3

func _on_double_body_entered(body):
	if body == N.player:
		if run:
			$get_double.play()
			run = false
			N.double == true
			hide()
			$Timer.start()
			
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Timer_timeout():
	N.double = false
	queue_free()
