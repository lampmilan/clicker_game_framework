extends Node

var t = Timer.new()

var money = 0
var click_multip = 1

var snitch_scapper_number = 0
var snitch_scapper_income = 0

func _ready():
	t.set_wait_time(1)
	self.add_child(t)
	t.start()
	t.connect("timeout", Callable(self, "_on_t_timeout"))


func _on_t_timeout():
	snitch_scapper_income = snitch_scapper_number*10
	money += snitch_scapper_income
