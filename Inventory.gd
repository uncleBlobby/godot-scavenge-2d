extends Node2D

onready var items = get_tree().get_nodes_in_group("items")
onready var itemList = get_node("/root/Main/Inventory/Panel/InventoryList")
onready var this = get_node(".")

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

# Called when the node enters the scene tree for the first time.
func _ready():
	if (itemClass):
		print("Preloading items class successful.")
		var item = itemClass.new()
		print(item.resources)
	pass # Replace with function body.

func _addItem(item):
	inventory[str(item.name)] = item
	var this = inventory[str(item.name)]
	this.quantity += 1
	print(this)

	itemList._clear()
	itemList._populateList(inventory)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
