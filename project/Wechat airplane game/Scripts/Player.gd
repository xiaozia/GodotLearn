extends RigidBody2D

# 飞机速度
var speed = 300
signal shoot
signal game_over

var bomb = true

func _ready():
	N.player = self

func _physics_process(delta):
	var player = Vector2()
	if Input.is_action_pressed("ui_up"):
		player.y -= 1
	if Input.is_action_pressed("ui_down"):
		player.y += 1
	if Input.is_action_pressed("ui_right"):
		player.x += 1
	if Input.is_action_pressed("ui_left"):
		player.x -= 1
	if player.length() > 0:
		player = player.normalized() * speed
	position += player * delta
	position.x = clamp(position.x, 60, 480 - 60)# 480是场景的高
	position.y = clamp(position.y, 70, 852 - 70)
	if Input.is_action_just_pressed("ui_accept"):
		if bomb and N.bomb_number != 0:
			N.bomb_number -= 1
			bomb = false
			N.bombing = true
			$use_bomb.play()
			$bomb_wait_Timer.start()
	if N.player_life == 0:
		N.game_over = true
		hide()
		emit_signal("game_over")

func _on_Bullet_Timer_timeout():
	emit_signal("shoot")

func _on_bomb_wait_Timer_timeout():
	bomb = true
