extends CanvasLayer

onready var animator = $AnimationPlayer
onready var color = $ColorRect

func change_scene(path):
	color.show()
	animator.play("scenechange")
	yield(animator, "animation_finished")
	get_tree().change_scene(path)
	animator.play_backwards("scenechange")
	yield(animator, "animation_finished")
	color.hide()
