extends Node

var Observer = null
var Game = null
var UpButton = null 
var DownButton = null 
var RightButton = null
var LeftButton = null 
var FireButton = null
var Buttons = null
var FireBall = preload("res://FireBall.tscn")
var FireBallPosition = null
var SkeletonScene = preload("res://Skeleton.tscn")
var PotionScene = preload("res://Potion.tscn")
var SkeletonPositions = []
var PotionPositions = []
var GameCamera = null
var PlayerHpBar = null
var RestartButton = null
var GameControl = null
var CountLabel = null
