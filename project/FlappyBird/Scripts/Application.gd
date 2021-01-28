#Application.gd
extends Node

var game_tscn = preload("res://Game.tscn")#把"Game.tscn"预加载进来

func _ready():
	add_to_group("GAME_STATE")#把自己加入"GAME_STATE"组
	get_tree().call_group("GAME_STATE","on_game_start")#调用"GAME_STATE"组的"on_game_start"方法
	
func on_game_start():
	var game = get_node_or_null("Game")#判断是否有名为"Game"的子节点
	if game != null: #判断是否有名为"Game"的子节点，如果有则移除并释放
		remove_child(game)
		game.queue_free()
	game = game_tscn.instance()#然后实例化一个新的"Game.tscn"并作为自己的子节点，开始新的一局
	add_child(game)
