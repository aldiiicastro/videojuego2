extends Node2D

export (PackedScene) var again
onready var boxes = get_tree().get_nodes_in_group("boxes")
var canLevitate = false

func _physics_process(delta):
	var playerPos = $Player.position
	for box in boxes:
		box.canLevitate =  box.position.distance_to(playerPos) < 200 
		if box.selected and Input.is_action_just_pressed("levitateBox"):
			box.impulseBox(playerPos)

func boxesLevitating(b):
	if canLevitate:
		for box in boxes:
			box.stopLevitate()
	b.selected = true
	canLevitate = true

func _on_Box_impulse():
	canLevitate = false


func _on_Button_pressed():
	get_tree().change_scene_to(again)
