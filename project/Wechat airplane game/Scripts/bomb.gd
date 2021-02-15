extends Area2D

var run = true

func _physics_process(delta):
	position.y += 3

func _on_bomb_body_entered(body):
		if body == N.player:
			if run:
				$get_bomb.play()
				run = false
				if N.bomb_number != 3:
					N.bomb_number += 1
				queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


