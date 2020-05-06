extends Area2D

onready var pos = $Position2D
export(int) var speed = 200
var velocity = Vector2()

func _physics_process(delta):
	translate(velocity.normalized()*speed*delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_FireBall_body_entered(body):
	if body.is_in_group("enemy"):
		body.hp -= 1
		body.animation.play("wounded")
		if body.hp <= 0:
			Global.Game.need_skeleton = true
			Global.Game.skeleton_count += 1
			body.queue_free()
	queue_free()