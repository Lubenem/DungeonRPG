extends KinematicBody2D

export(int) var speed = 100
var hp = 2
var player = Global.Observer
onready var animation = $Animation

func _physics_process(delta):
	if Global.Observer:
		var velocity = (player.position - global_position).normalized() * speed
		$Sprite.flip_h = velocity.x < 0
		var object = move_and_collide(velocity*delta)
		if object and object.collider.is_in_group("player"):
			player.health -= 1
	
	
	
	
	



