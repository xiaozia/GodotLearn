extends Control

func _on_Button_pressed():
	if self.name == "scene2":
		SceneChanger.change_scene("res://scene1.tscn")
	else:
		SceneChanger.change_scene("res://scene2.tscn")
