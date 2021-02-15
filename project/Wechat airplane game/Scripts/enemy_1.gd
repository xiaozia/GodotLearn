extends Area2D

var run = true

func _physics_process(delta):
	if N.bombing:
		$AnimatedSprite.play("over")
		yield($AnimatedSprite, "animation_finished")
		N.bombing = false
		queue_free()
	if N.game_over:
		queue_free()
	position.y += 2

func _on_enemy_1_body_exited(body):
	if run:
		run = false
		if body == N.player:
			N.player_life -= 1
		else:
			body.queue_free()
		$over.play()
		$AnimatedSprite.play("over")
		yield($AnimatedSprite, "animation_finished")
		N.score += 10
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
