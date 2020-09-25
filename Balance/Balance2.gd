extends Node2D

var velocity = Vector2()
var height  = 0
var massBox = 0
func _ready():
	##$BalanceLeft.add_central_force(Vector2(0,-98))
	##$BalanceRight.add_central_force(Vector2(0,-98))
	pass

func _physics_process(delta):
	if $BalanceLeft.get_colliding_bodies().size() == 1:
		if height < (massBox* $BalanceLeft.get_colliding_bodies().size()) +110 and $BalanceLeft.get_colliding_bodies() != []:
			$BalanceRight.set_linear_velocity(Vector2(0, velocity.y))  
			height += massBox
		if height == (massBox * $BalanceLeft.get_colliding_bodies().size()) +110:            
			$BalanceRight.set_sleeping(true)
	if $BalanceLeft.get_colliding_bodies().size() == 2:
		if height < (massBox* $BalanceLeft.get_colliding_bodies().size()) +200 and $BalanceLeft.get_colliding_bodies() != []:
			$BalanceRight.set_linear_velocity(Vector2(0, velocity.y))  
			height += massBox
		if height == (massBox * $BalanceLeft.get_colliding_bodies().size()) +200:            
			$BalanceRight.set_sleeping(true)
	if $BalanceLeft.get_colliding_bodies().size() == 3:
		if height < (massBox* $BalanceLeft.get_colliding_bodies().size()) +300 and $BalanceLeft.get_colliding_bodies() != []:
			$BalanceRight.set_linear_velocity(Vector2(0, velocity.y))  
			height += massBox
		if height == (massBox * $BalanceLeft.get_colliding_bodies().size()) +300:            
			$BalanceRight.set_sleeping(true)


func _on_BalanceLeft_body_entered(body):
	if body.is_in_group('boxes'):
		velocity = -$BalanceLeft.get_linear_velocity()
		massBox = body.get_mass()
