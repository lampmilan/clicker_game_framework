extends ScrollContainer

var snitch_scapper_price = 15
var stemp_autobuyer_price = 100
var click_sound = SoundPlayer.get_node("ClickSound")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_upgrade_prices($VBoxContainer/SnitchScrapperButton, snitch_scapper_price)
	
func check_upgrade_prices(object, price):
	if object:
		enable_button(object, price)


func enable_button(upgrade, price):
	if MoneySingleton.money >= price:
		upgrade.disabled = false
	else:
		upgrade.disabled = true


func _on_snitch_scrapper_button_pressed():
	MoneySingleton.money -= snitch_scapper_price
	snitch_scapper_price *= 2
	MoneySingleton.snitch_scapper_number += 1
	click_sound.play()
	$VBoxContainer/SnitchScrapperButton/SnitchScrapperPrice.set_text("$ "+str(snitch_scapper_price))
	$VBoxContainer/SnitchScrapperButton/SnitchScrapperNumber.set_text(str(MoneySingleton.snitch_scapper_number))
