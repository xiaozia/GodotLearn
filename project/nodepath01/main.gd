extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	print($Label)
	print(get_node("Label"))
	print($"Label 2")
	
	print($Control2/Label3)
	print(get_node("Control2/Label3"))
