extends Node2D

export (PackedScene) var firstLevel


func startGame():
	get_tree().change_scene_to(firstLevel)
