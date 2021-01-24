extends Node2D

#炮弹速度
export var speed = 500

func _process(delta):
	#炮弹向右飞
	#因为在本场景被添加进主场景时，会将本场景的根节点角度设置为炮管的角度
	#所以本场景的Sprite只需要改变x坐标，也能实现向不同角度发射的目的
	$Sprite.position.x += speed * delta
	
	#当发射出去1000px远时，删除自身以释放资源
	if $Sprite.position.x > 1000:
		self.get_parent().remove_child(self)
