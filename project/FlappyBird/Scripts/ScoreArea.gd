extends Area2D


func _ready():
	connect("body_exited",self,"_on_body_exited")
func _on_body_exited(_body):
	if _body.name == "Bird":#先通过body的名字判断一下所撞之物是否为"Bird"
		print("得分！！！！")
