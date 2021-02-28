extends KinematicBody2D

const ball_scene = preload("res://Mini Scenes/Ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var y = position.y
	var mouse_x = get_viewport().get_mouse_position().x
	position = Vector2(mouse_x, y)
	
func _input(event):
	if (event is InputEventMouseButton or event is InputEventScreenTouch) and event.pressed:
		var ball = ball_scene.instance()
		ball.position = position - Vector2(0, 16)
