extends Tween

var camera : Camera2D
var strength : float = 50 #振幅
var duration : float = 1.0#震动时长


func _ready():
	add_to_group("GAME_STATE") #加入"GAME_STATE"组
	camera = get_parent() as Camera2D
	
func disturb_offset(s : float):
	camera.position.x = rand_range(-s,s)
	camera.position.y = rand_range(-s,s)

func on_game_over():
	interpolate_method(self,"disturb_offset",strength,0,duration,Tween.TRANS_SINE,Tween.EASE_OUT,0)
	start()
