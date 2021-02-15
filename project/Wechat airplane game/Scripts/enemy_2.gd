extends Area2D

var run = true
var life = 5

func _physics_process(delta):
	if N.bombing:
		life = 0
		$ProgressBar.value = life * 20
		$AnimatedSprite.play("over")
		yield($AnimatedSprite, "animation_finished")
		N.bombing = false
		queue_free()
	if N.game_over:
		queue_free()
	position.y += 1

func _on_enemy_2_body_entered(body):
	if run and life == 1:
		run = false
		if body == N.player:
			N.player_life -= 1
		else:
			body.queue_free()
		life -= 1
		$ProgressBar.value = life * 20
		$over.play()
		$AnimatedSprite.play("over")
		yield($AnimatedSprite, "animation_finished")
		N.score += 30
		queue_free()
	elif run:
		if body == N.player:
			N.player_life -= 1
			run = false
			life = 0
			$ProgressBar.value = life * 20
			$AnimatedSprite.play("over")
			yield($AnimatedSprite, "animation_finished")
			queue_free()
			N.score += 30
		else:
			body.queue_free()
		life -= 1
		$ProgressBar.value = life * 20
		$AnimatedSprite.play("hit")
		yield($AnimatedSprite, "animation_finished")
		$AnimatedSprite.play("fly")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
