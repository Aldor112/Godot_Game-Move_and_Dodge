extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MesaggeTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($MesaggeTimer, "timeout")
	
	$MessageLabel.text = "Dodge The \nCreeps!"
	$MessageLabel.show()
	
	yield(get_tree().create_timer(1),"timeout")
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)
	

func _on_MesaggeTimer_timeout():
	$MessageLabel.hide()


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
