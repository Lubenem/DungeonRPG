extends Node2D

func _ready():
	Global.SkeletonPositions = get_children()
	