extends PanelContainer


onready var inventory = get_node("/root/Main/Inventory")
onready var this = get_node(".")
onready var itemList = get_node("ItemList")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# loop through all items in inventory contents and adds them to the inventory list window!
func _populateList(inventory):

	for items in inventory:
		if inventory[str(items)].quantity > 0:
			var texture = load(inventory[str(items)].sprite)
			itemList.add_item(inventory[items].name + " " + str(inventory[str(items)].quantity), texture, true)


func _clear():
	itemList.clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#inventory = get_node("/root/Main/Inventory")
	#_populateList(inventory)
	pass
