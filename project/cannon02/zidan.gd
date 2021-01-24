extends Node2D

#炮弹速度
export var speed = 500


func _process(delta):
	#当超出屏幕时，删除自身以释放资源
	if self.position.y > 1000:
		self.get_parent().remove_child(self)
