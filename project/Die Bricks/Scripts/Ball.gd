extends RigidBody2D

export var speedup = 4
const MAXSPEED = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			get_parent().score += 5
			body.queue_free()
			
		if body.get_name() == "Paddle":
			var speed = linear_velocity.length()
			var direction = position - body.get_node("Ancor").global_position
			var velocity = direction.normalized()*min(speed+speedup, MAXSPEED)
			linear_velocity = velocity
			print(str(speed+speedup))
			
	if position.y > get_viewport_rect().end.y:
		print("Ball died.")
		queue_free()
