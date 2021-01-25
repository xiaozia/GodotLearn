extends Label

func _ready():
	print($".".name)
	print(get_node(".").name)
	
	print($"../".name)
	print($"../../2/Label2".name)
	
	print(get_node("../../2/Label2").name)
	print(get_parent().get_parent().get_node("2/Label2").name)
	print(get_parent().get_parent().find_node("Label2", true, false).name)
	
	
