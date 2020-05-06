extends Node

var need_potion = false
var need_skeleton = false
var skeleton_count = 0 setget setcount
onready var potion_positions = Global.PotionPositions


var inter_id = ""
var test_inter_id = ""
onready var admob = ad()


func ad():
	if Engine.has_singleton("AdMob"):
		var admob = Engine.get_singleton("AdMob")
		admob.init(true, get_instance_id()) 
		admob.loadInterstitial(inter_id)
		return admob

func show_inter():
	if admob:
		admob.showInterstitial()

func _physics_process(delta):
	if need_potion:
		randomize()
		var rand_pos = potion_positions[randi() % potion_positions.size()]
		rand_pos.add_child(Global.PotionScene.instance())
		potion_positions.erase(rand_pos)
		need_potion = false
	if need_skeleton:
		randomize()
		Global.SkeletonPositions[randi() % Global.SkeletonPositions.size()].add_child(Global.SkeletonScene.instance())
		need_skeleton = false

func _ready():
	Global.Game = self
	skeleton_spawn()
	potion_spawn()
	

func setcount(new):
	skeleton_count = new
	Global.CountLabel.text = str(skeleton_count)

func _on_HideButton_pressed():
	Global.Buttons.visible = !Global.Buttons.visible

func skeleton_spawn():
	for skeletonpos in Global.SkeletonPositions:
		skeletonpos.add_child(Global.SkeletonScene.instance())

func potion_spawn():
	potion_positions[0].add_child(Global.PotionScene.instance())
	potion_positions.remove(0)
	for i in range(4):
		randomize()
		var rand_pos = potion_positions[randi() % potion_positions.size()]
		rand_pos.add_child(Global.PotionScene.instance())
		potion_positions.erase(rand_pos)


func _on_RestartButton_pressed():
	show_inter()
	get_tree().reload_current_scene()



func _on_Observer_tree_exited():
	pass
