extends Area2D

export (PackedScene) var nextLevel
var canTransport = false

func _physics_process(delta):
	if canTransport and Input.is_action_just_pressed("level"):
		get_tree().change_scene_to(nextLevel)

func _on_Door_body_entered(body):
	if body.is_in_group("player"):
		canTransport = true

func _on_Door_body_exited(body):
	if body.is_in_group("player"):
		canTransport = false
