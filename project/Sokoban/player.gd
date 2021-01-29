extends KinematicBody2D

var inputs = {
	"ui_up": Vector2.UP,
	"ui_right": Vector2.RIGHT,
	"ui_left": Vector2.LEFT,
	"ui_down": Vector2.DOWN
}

onready var ray = $RayCast2D

func _input(event):
	for dir in inputs:
		if event.is_action_pressed(dir):
			move(dir)
			
func move(dir):
	var pos = inputs[dir] * 16
	ray.cast_to = pos
	ray.force_raycast_update()
	if ray.is_colliding():
		var collider = ray.get_collider() 
		if collider.is_in_group("box"):
			if collider.move(dir):
				self.position += pos
		pass
	else:
		self.position += pos
