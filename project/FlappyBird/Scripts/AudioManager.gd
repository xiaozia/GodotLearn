extends Node

func play(name : String):
	var sfx = find_node(name)
	if sfx is AudioStreamPlayer:
		sfx.play()
