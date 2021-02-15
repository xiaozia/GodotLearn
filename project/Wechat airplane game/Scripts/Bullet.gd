extends RigidBody2D

func _physics_process(delta):
	position.y -= 300 * delta

func _ready():
	if N.double:
		$Sprite.texture = load("res://Assets/image/missile_1.png")
	else:
		$Sprite.texture = load("res://Assets/image/missile_2.png")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
