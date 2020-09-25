extends RigidBody2D
signal levitating
signal impulse

export var impulseForce = 0.7
export var levitateVel = -4
var canLevitate = false
var height = 0
var selected = false

func stopLevitate():
	set_sleeping(false)
	selected = false

func _physics_process(delta):
	if height < 400 and selected:
		apply_central_impulse(Vector2(0, levitateVel))
		height -= levitateVel
		print(height)
	if height == 400:
		set_sleeping(true)
		height += 1

func _on_Box_input_event(viewport, event, shape_idx):
	if !selected:
		height = 0
	if canLevitate and event.is_action_pressed("click"):
		selected = true
		emit_signal("levitating", self)

func impulseBox(playerPos):
	emit_signal("impulse")
	set_sleeping(false)
	selected = false
	apply_central_impulse((position - playerPos) * impulseForce)
