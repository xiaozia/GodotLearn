extends Node2D

#定义变量时在前面加 export，表示可以在编辑器中直接修改
#大炮左右移动的速度 px/s
export var speed = 100

#炮管旋转速度 角度/s
export var rotation_speed = 60

#发射CD s
export var cd = 0.3

#炮管最高仰角
export var max_rotation = 60

#炮管最低仰角
export var min_rotation = 0

#加载zidan场景，并存到zidan变量中
var zidan = preload("res://zidan.tscn")

#为当前的cd计时
var cd_timer = 0

#每秒轮子需要转多少度
var r

#初始化
func _ready():
	#计算每秒轮子需要转多少度
	#r放到这里计算而不是_process中，是因为这里计算结果不会改变
	#如果放到_process中，就会每帧计算重复的内容，影响运行效率
	r = speed / (150 * PI) * 360

#每帧运行
func _process(delta):
	# 定义变量move，当按下左键或右键时，分别为move赋不同的值
	var move = 0
	if Input.is_action_pressed("ui_right"):
		move += 1
	if Input.is_action_pressed("ui_left"):
		move -= 1
	#这里使用 move+=1 、 move-=1，而不是 move=1 、 move=-1
	#这是因为前者在同时按下左右键时，move的最终结果为0，而后者的move最终结果为-1
	
	# 如果move不为0，说明按下了左或右键
	if move != 0:
		#使用 $节点名称 来调用节点，$节点名称/节点名称 来调用多层子节点
		#position是位置属性，rotation_degrees是以角度为单位的旋转，rotation是以弧度为单位的旋转
		#delta是_process方法的参数，表示本帧距离上一帧间隔的时间，单位是秒
		#速度乘以delta，可以确保在不同的帧率下，物体的移动速度相同
		$dapao.position.x += speed * move * delta
		$dapao/lunzi.rotation_degrees += r * move * delta
	
	#当按下上键或下键时，改变炮管的方向
	if Input.is_action_pressed("ui_up"):
		$dapao/paoguan.rotation_degrees -= rotation_speed * delta
		#限制仰角最大值，这里为什么要用负数呢，因为负数是逆时针，和我们在游戏里要的效果相反
		if $dapao/paoguan.rotation_degrees < -max_rotation:
			$dapao/paoguan.rotation_degrees = -max_rotation
	if Input.is_action_pressed("ui_down"):
		$dapao/paoguan.rotation_degrees += rotation_speed * delta
		if $dapao/paoguan.rotation_degrees > min_rotation:
			$dapao/paoguan.rotation_degrees = min_rotation
	
	#记录cd时间
	cd_timer -= delta
	
	#当按下空格键时，发射子弹
	if Input.is_action_pressed("ui_select") and cd_timer < 0:
		#实例化一个zidan场景对象
		var zidanObj = zidan.instance()
		#设置这个子弹的位置，global_position为全局位置
		zidanObj.position = $dapao/paoguan/zidanguadian.global_position
		#使子弹的角度与炮管的当前角度相同
		zidanObj.rotation_degrees = $dapao/paoguan.rotation_degrees
		#把子弹添加进场景
		add_child(zidanObj)
		#设置cd时间
		cd_timer = cd
