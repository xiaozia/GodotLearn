extends Node2D

var game_end = false

func _process(delta):
	check_end()

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
			if $".".name == "Level2" :
				print("complete!")
			else:
				get_tree().change_scene("res://Level2.tscn")
