extends Node2D

onready var items = get_tree().get_nodes_in_group("items")
onready var itemList = get_node("/root/Main/Inventory/Panel/InventoryList")
onready var inventoryList = get_node("/root/Main/Inventory/Panel/InventoryList/ItemList")
onready var this = get_node(".")

onready var main = preload("Main.gd")

onready var itemClass = preload("Items.gd")

var isVisible = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var contents = {
	stick = {
		name = "Stick",
		quantity = 0,
		description = "A piece of wood."
	},
	stone = {
		name = "Stone",
		quantity = 0,
		description = "A small rock."
	},
	plantFiber = {
		name = "Plant Fiber",
		quantity = 0,
		description = "A tuft of grass, useful for crafting."
	},
	berries = {
		name = "Berries",
		quantity = 0,
		description = "A handful of tasty berries."
	},
	flint = {
		name = "Flint",
		quantity = 0,
		description = "Useful for starting fires."
	}
}

var inventory = {}
var newMain
var globals

# Called when the node enters the scene tree for the first time.
func _ready():
	if (itemClass):
		print("Preloading items class successful.")
		var item = itemClass.new()
		print(item.resources)
	newMain = main.new()
	globals = newMain.globals
	pass # Replace with function body.

func _addItem(item):
	inventory[str(item.name)] = item
	var thisItem = inventory[str(item.name)]
	thisItem.quantity += 1

	itemList._clear()
	itemList._populateList(inventory)
	if globals.activeInventoryItem != null:
		inventoryList.select(globals.activeInventoryItem[0])
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	globals = newMain.globals
	if inventoryList.is_anything_selected():
		if globals.activeInventoryItem == null:
			var selected = inventoryList.get_selected_items()
			globals.activeInventoryItem = inventoryList.get_selected_items()
			var itemName = inventoryList.get_item_text(selected[0])			
			pass
		if globals.activeInventoryItem != null:
			var selected = inventoryList.get_selected_items()
			globals.activeInventoryItem = inventoryList.get_selected_items()
	if !inventoryList.is_anything_selected():
		if globals.activeInventoryItem != null:
			#itemDetailList populates to the right
			var selected = inventoryList.get_selected_items()
			globals.activeInventoryItem = inventoryList.get_selected_items()


