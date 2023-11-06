extends ScrollContainer

var click_sound = SoundPlayer.get_node("ClickSound")
var upgrades = [
   {
	   "node": "HBoxContainer/OneStartUpgrade",
	   "price": 10,
	   "description": "Increase gain from manually downloaded game by 25/per click",
	   "effect": 25
   },
]


func _process(delta):
	for i in upgrades:
		var node = get_node(i["node"])
		check_upgrade_prices(node, i["price"])


func check_upgrade_prices(object, price):
	if object:
		enable_button(object, price)


func enable_button(upgrade, price):
	if MoneySingleton.money > price/1.8:
		upgrade.visible = true
		
	if MoneySingleton.money >= price:
		upgrade.disabled = false
	else:
		upgrade.disabled = true


func call_upgrade(index):
	MoneySingleton.money -= upgrades[index]["price"]
	MoneySingleton.click_multip += upgrades[index]["effect"]
	click_sound.play()
	var node = get_node(upgrades[index]["node"])
	node.queue_free()


func _on_one_start_upgrade_pressed():
	call_upgrade(0)

