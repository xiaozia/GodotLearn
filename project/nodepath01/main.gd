extends Control

export var labelPath : NodePath

func _ready():
	print($Control2/Label3.text)
	print($Control3/Label3.text)
	print(get_tree().get_root().find_node("Label3", true, false).text)
	print(get_node(labelPath).text)
