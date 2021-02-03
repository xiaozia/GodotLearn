extends KinematicBody2D

var inputs = {
	"ui_up": Vector2.UP,
	"ui_right": Vector2.RIGHT,
	"ui_left": Vector2.LEFT,
	"ui_down": Vector2.DOWN
}

onready var ray = $RayCast2D

func move(dir):
	var pos = inputs[dir] * 16
	ray.cast_to = pos
	ray.force_raycast_update()
	$Tween.interpolate_property(self, "position", self.position, self.position+pos, 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	if ray.is_colliding():
		return false
		pass
	else:
		$Tween.start()
		return true

