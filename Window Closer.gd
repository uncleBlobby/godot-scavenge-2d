extends Node2D

onready var this = get_node(".")

onready var closeButton = get_node("Button")
onready var inventory = get_node("/root/Main/Inventory")

#onready var inventoryButton = get_node("/root/Main/MainButtonHandle/InventoryButton")



# Called when the node enters the scene tree for the first time.
func _ready():
	closeButton.connect("button_up", self, "_closeWindow")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#inventoryWindow = get_node("/root/Main/Inventory")
	pass

func _helloWorld():
	print("Hello World")
	
func _closeWindow():
	inventory["isVisible"] = false
	inventory.hide()

