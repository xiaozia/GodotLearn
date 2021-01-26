# Bird.gd
extends RigidBody2D

func _ready():
	connect("body_entered",self,"on_body_entered")

func _physics_process(delta):
	if Input.is_mouse_button_pressed(1):
		linear_velocity = Vector2.UP*500
		angular_velocity = -3.0
	if rotation_degrees < -30:#最大仰角30度
		rotation_degrees = -30
		angular_velocity = 0
	if linear_velocity.y > 0.0:#下坠时给它一个顺时针的角速度
		angular_velocity = 1.5

func on_body_entered(_body):
	if _body is StaticBody2D:#先通过body的类型判断一下所撞之物是否为一个"StaticBody2D"
		print("Die.....")

