# Bird.gd
extends RigidBody2D

func _physics_process(delta):
	if Input.is_mouse_button_pressed(1):
		linear_velocity = Vector2.UP*500
		angular_velocity = -3.0
	if rotation_degrees < -30:#最大仰角30度
		rotation_degrees = -30
		angular_velocity = 0
	if linear_velocity.y > 0.0:#下坠时给它一个顺时针的角速度
		angular_velocity = 1.5


