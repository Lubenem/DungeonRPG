extends Control

func _ready():
	Global.Buttons = self
	Global.UpButton = $UpButton 
	Global.DownButton = $DownButton 
	Global.RightButton = $RightButton 
	Global.LeftButton = $LeftButton 
	Global.FireButton = $FireButton 
