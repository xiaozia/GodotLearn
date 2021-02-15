extends Area2D

var run = true
var life = 10

func _physics_process(delta):
	if N.bombing:
		life = 0
		$ProgressBar.value = life * 10
		$AnimatedSprite.play("over")
		yield($AnimatedSprite, "animation_finished")
		N.bombing = false
		queue_free()
	if N.game_over:
		queue_free()
	position.y += 0.5

func _on_enemy_3_body_entered(body):
	if run and life == 1:
		run = false
		if body == N.player:
			N.player_life -= 1
		else:
			body.queue_free()
		life -= 1
		$ProgressBar.value = life * 10
		$over.play()
		$AnimatedSprite.play("over")
		yield($AnimatedSprite, "animation_finished")
		N.score += 50
		queue_free()
	elif run:
		if body == N.player:
			N.player_life -= 1
			run = false
			life = 0
			$ProgressBar.value = life * 10
			$AnimatedSprite.play("over")
			yield($AnimatedSprite, "animation_finished")
			N.score += 50
			queue_free()
		else:
			body.queue_free()
		life -= 1
		$ProgressBar.value = life * 10
		$AnimatedSprite.play("hit")
		yield($AnimatedSprite, "animation_finished")
		$AnimatedSprite.play("fly")

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
