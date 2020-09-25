extends Node2D
signal startGame

func showMessage(text):
	$GameLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func winGameI():
	showMessage("GANASTE!!")
	yield($MessageTimer, "timeout")
	$StartBtn.show()
	$GameLabel.text = "Violeta Telequinetica"
	$GameLabel.show()
	$MessageLabel.show()
	$Label3.show()

func _on_MessageTimer_timeout():
	$GameLabel.hide()
	$MessageLabel.hide()
	$Label3.hide()

func updateScore(score):
	$ScoreLabel.text = str(score)

func _on_StartBtn_pressed():
	$StartBtn.hide()
	emit_signal("startGame")
