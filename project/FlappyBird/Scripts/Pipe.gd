extends Node2D

func _ready():
	add_to_group("GAME_STATE") #加入GAME_STATE组
	position.y += randf()*300-150 #Y轴随机偏移量的范围(-150,150)

func _process(delta):
	position += Vector2.LEFT*200.0*delta
	if position.x < 0:
		queue_free()

func on_game_over():
	set_process(false) #停用_process(delta)
	print("Pipe game over")
