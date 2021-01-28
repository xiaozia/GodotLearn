extends Sprite

func _ready():
	add_to_group("GAME_STATE")
	offset.x = 530

func _process(delta):
	if offset.x <= -530.0:
		offset.x = 527.0 #重叠3个像素以防穿帮
	offset.x -= 200.0*delta

func on_game_over():
	set_process(false)
