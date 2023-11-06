extends Node2D

var popup_scene = preload("res://scenes/popup_window_scene.tscn")
var new_popup = Node.new()


func _on_timer_timeout():
	var random_x_pos = randf_range(-500, 50)
	var random_y_pos = randf_range(-300, 50)
	new_popup = popup_scene.instantiate()
	add_child(new_popup)
	new_popup.position = Vector2(random_x_pos, random_y_pos)
	new_popup.connect("on_close", Callable(self, "_on_popup_closed"))


func _on_popup_closed():
	MoneySingleton.money += 1*MoneySingleton.click_multip

