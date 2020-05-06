extends Area2D


func _on_Potion_body_entered(body):
	if body.is_in_group("player"):
		body.health += 100
		Global.Game.potion_positions += [get_parent()]
		Global.Game.need_potion = true
		queue_free()
