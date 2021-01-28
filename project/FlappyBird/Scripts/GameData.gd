#GameData.gd
extends Node

var score = 0

func update_record():
	if score > load_record():
		FileHelper.save("user://record.res",score)

func load_record():
	return  FileHelper.read("user://record.res",0)
