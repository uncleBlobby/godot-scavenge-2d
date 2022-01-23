extends PanelContainer


onready var inventory = get_node("/root/Main/Inventory")
onready var this = get_node(".")
onready var itemList = get_node("ItemList")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# loop through all items in inventory contents and add a text label for them
func _populateList(inventory):

	for items in inventory.contents.keys():
		if inventory.contents[str(items)].quantity > 0:
			itemList.add_item(inventory.contents[items].name + " " + str(inventory.contents[str(items)].quantity), null, true)


func _clear():
	itemList.clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#inventory = get_node("/root/Main/Inventory")
	#_populateList(inventory)
	pass
