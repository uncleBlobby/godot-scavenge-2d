extends Button


onready var inventory = get_node("/root/Main/Inventory")
onready var this = get_node(".")

var isVisible = false


# Called when the node enters the scene tree for the first time.
func _ready():
	this.connect("pressed", self, "_showHideInventoryPanel")
	inventory.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	inventory = get_node("/root/Main/Inventory")
	pass

func _printInventory():
	for items in inventory.contents:
		print(items.name)
	#print(inventory.contents)


func _showHideInventoryPanel():
	if !isVisible:
		inventory.show()
		isVisible = true
	else:
		inventory.hide()
		isVisible = false
	#print(inventory.hide())
