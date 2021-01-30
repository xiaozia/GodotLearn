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
			if $Tween.is_active() == false:
				move(dir)
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
		
func move(dir):
	var pos = inputs[dir] * 16
	ray.cast_to = pos
	ray.force_raycast_update()
	$Tween.interpolate_property(self, "position", self.position, self.position+pos, 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	if ray.is_colliding():
		var collider = ray.get_collider() 
		if collider.is_in_group("box"):
			if collider.move(dir):
				$Tween.start()
		pass
	else:
		$Tween.start()
	pass
	
var game_end = false

func check_end():
	if !game_end:
		var spots = get_tree().get_nodes_in_group("spot")
		var tempNum = 0
		for spot in spots:
			if spot.isActive == true:
				tempNum += 1
		if tempNum == spots.size():
			print("game end!")
			game_end = true

func _on_Tween_tween_all_completed():
	check_end()
