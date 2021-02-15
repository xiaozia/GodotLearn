extends Node2D

var bullet = preload("res://Scene/Bullet.tscn")
var enemy1 = preload("res://Scene/enemy_1.tscn")
var enemy2 = preload("res://Scene/enemy_2.tscn")
var enemy3 = preload("res://Scene/enemy_3.tscn")
var double = preload("res://Scene/double.tscn")
var bomb = preload("res://Scene/bomb.tscn")

func _ready():
	$enemy1_Timer.wait_time = randi() % 2 + 0.1
	$enemy2_Timer.wait_time = randi() % 4 + 3
	$enemy3_Timer.wait_time = randi() % 8 + 4
	
func _physics_process(delta):
	$life/life_Label.text = str(N.player_life)
	$ScoreLabel.text = str(N.score)
	$bomb_Sprite/Label.text = "x " + str(N.bomb_number)
	$bomb_Sprite/Label.raise()
	$ScoreLabel.raise()

func _on_Player_shoot():
	if not N.game_over:
		$bullet.play()
		var b = bullet.instance()
		add_child(b)
		if N.double:
			var a = bullet.instance()
			add_child(a)
			b.position = $Player.position
			b.position.y -= 60
			b.position.x += 30
			a.position = $Player.position
			a.position.y -= 60
			a.position.x -= 30
		else:
			b.position = $Player.position
			b.position.y -= 60

func _on_enemy1_Timer_timeout():
	if not N.game_over:
		$enemy1_Timer.wait_time = (randi() % 2) + 0.1
		var e1 = enemy1.instance()
		add_child(e1)
		e1.position.x = randi() % 480

func _on_enemy2_Timer_timeout():
	if not N.game_over:
		$enemy2_Timer.wait_time = (randi() % 4) + 3
		var e2 = enemy2.instance()
		add_child(e2)
		e2.position.x = randi() % 480

func _on_enemy3_Timer_timeout():
	if not N.game_over:
		$enemy3_Timer.wait_time = (randi() % 8) + 4
		var e3 = enemy3.instance()
		add_child(e3)
		e3.position.x = randi() % 480

func _on_double_Timer_timeout():
	if not N.game_over:
		$double_Timer.wait_time = (randi() % 20) + 10
		var d = double.instance()
		add_child(d)
		d.position.x = randi() % 480

func _on_bomb_Timer_timeout():
	if not N.game_over:
		$bomb_Timer.wait_time = (randi() % 30) + 20
		var b = bomb.instance()
		add_child(b)
		b.position.x = randi() % 480

func _on_Player_game_over():
	$game_over_music.play()
	$game_over_Panel.show()
	$game_over_Panel/Label2.text = "分数" + str(N.score)

func _on_exit_pressed():
	get_tree().quit()

func _on_again_pressed():
	N.game_over = false
	$game_over_Panel.hide()
	N.score = 0
	N.player_life = 3
	N.double = false
	N.bomb_number = 3
	$Player.show()
	$Player.position = Vector2(240, 778)

func _on_game_music_finished():
	$game_music.play()

func _on_bullet_finished():
	pass # Replace with function body.
