extends Node2D

func _ready():
	Global.SkeletonPositions = $Skeletons.get_children()
	Global.PotionPositions = $Potions.get_children()
