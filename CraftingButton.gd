extends Button


onready var craftingPanel = get_node("/root/Main/Crafting/Panel")
onready var this = get_node(".")

var isVisible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	this.connect("pressed", self, "_showHideCraftingPanel")
	craftingPanel.hide()
	pass # Replace with function body.


func _showHideCraftingPanel():
	if !isVisible:
		craftingPanel.show()
		isVisible = true
	else: 
		craftingPanel.hide()
		isVisible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
