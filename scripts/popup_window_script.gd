extends Node2D

signal on_close


# Called when the node enters the scene tree for the first time.
func _ready():
	var pop_sound = SoundPlayer.get_node("PopUpSound")
	pop_sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	var click_sound = SoundPlayer.get_node("ClickSound")
	click_sound.play()
	visible = false
	emit_signal("on_close")
func _on_click_sound_finished():
	queue_free()


func _on_remove_timer_timeout():
	$AnimationPlayer.play("close")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "close":
		queue_free()

