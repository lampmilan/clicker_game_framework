extends RichTextLabel


var game_titles = [
"GAME TITLE",
"OTHER GAME TITLE",
"MORE GAME TITLE"
]
var max_lenght = len(game_titles)

# Called when the node enters the scene tree for the first time.
func _ready():
	var random_number = randi_range(0, max_lenght-1)
	var title = game_titles[random_number]
	append_text(title)
