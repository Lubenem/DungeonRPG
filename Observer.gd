extends KinematicBody2D

enum DIRECTION {UP, DOWN, LEFT, RIGHT}

export(int) var max_health = 100
var health = max_health setget change_health
export(int) var speed = 50
var move_up = null
var move_down = null
var move_left = null
var move_right = null
var cast_fireball = null
var firball_direction = Vector2(1, 0)
var takes_damage = false
var takes_health = false


func change_health(new):
	if new > health:
		$Animation.play("takes_health")
	if new < health:
		$Animation.play("takes_damage")
	health = clamp(new, 0,  max_health)
	Global.PlayerHpBar.value = health
	if health == 0:
		die()

func die():
#	$Animation.play("die")
	Global.Observer = null
	Global.GameCamera.current = true
	Global.RestartButton.visible = true
	Global.GameControl.visible = false
	queue_free()


func _ready():
	Global.Observer = self


func _physics_process(delta):
	button_input()
	get_input()
	move_and_slide(action().normalized() * speed)


func get_input():
	if Input.is_action_pressed("ui_up"):
		move_up = true
	if Input.is_action_pressed("ui_down"):
		move_down = true
	if Input.is_action_pressed("ui_left"):
		move_left = true
	if Input.is_action_pressed("ui_right"):
		move_right = true
	if Input.is_action_just_pressed("F"):
		cast_fireball = true


func action():
	var velocity = Vector2()
	if move_up:
		velocity.y -= 1
	if move_down:
		velocity.y += 1
	if move_left:
		$Sprite.flip_h = true
		velocity.x -= 1
	if move_right:
		$Sprite.flip_h = false
		velocity.x += 1
	if velocity != Vector2():
		firball_direction = velocity
	if cast_fireball:
		$Animation.play("blue_fireball")
		var fireball = Global.FireBall.instance()
		fireball.position = position
		fireball.rotation = firball_direction.angle()
		fireball.velocity = firball_direction
		get_parent().add_child(fireball)

	move_up = null
	move_down = null
	move_left = null
	move_right = null
	cast_fireball = null

	return velocity


func button_input():
	if Global.UpButton.is_pressed():
		move_up = true
	if Global.DownButton.is_pressed():
		move_down = true
	if Global.LeftButton.is_pressed():
		move_left = true
	if Global.RightButton.is_pressed():
		move_right = true


func _on_FireButton_button_down():
	cast_fireball = true


func _on_Timer_timeout():
	health -= 5
	Global.PlayerHpBar.value = health
	if health <= 0:
		die()
