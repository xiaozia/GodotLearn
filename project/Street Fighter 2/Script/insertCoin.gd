extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	setCoins(GlobalDefine.coins)

func _input(event):
	if event.is_action_pressed("ui_start"):
		print("input: ui_start")
	if Input.is_action_pressed("ui_insertCoin"):
		GlobalDefine.coins += 1
		setCoins(GlobalDefine.coins)

func setCoins(num):
	if num >= 9:
		get_node("coinNum").frame = 9
	else:
		get_node("coinNum").frame = GlobalDefine.coins
