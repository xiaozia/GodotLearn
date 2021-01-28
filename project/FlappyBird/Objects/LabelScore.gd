extends Label

func _ready():
	add_to_group("SCORE")#把自己加入"SCORE"组

func on_score_updated(score):#当接收到"SCORE"组的调用时，更新分数
	text = str(score)
