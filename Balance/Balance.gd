extends Node2D


func _ready():
	$BalanceLeft.add_central_force(Vector2(0,-98))
	$BalanceRight.add_central_force(Vector2(0,-98))


func _physics_process(delta):
	for body in $BalanceLeft.get_colliding_bodies():
		if body.is_in_group('boxes'):
			$BalanceRight.apply_central_impulse(Vector2.UP * body.mass)
