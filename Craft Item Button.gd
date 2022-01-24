extends Button

onready var craftingPanel = get_node("/root/Main/Crafting")
onready var inventory = get_node("/root/Main/Inventory")
onready var rLabel = get_node("/root/Main/Crafting/Panel/RecipeDetailWindow/RecipeDetailLabel")

onready var selectedRecipeName = null

var craftableItem = []


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Crafiting Button Ready")
	print(rLabel.get_text())
	#craftableItem.append(rLabel.get_text())
	connect("button_up", self, "_craftItem", craftableItem)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#
func _process(delta):
	rLabel = get_node("/root/Main/Crafting/Panel/RecipeDetailWindow/RecipeDetailLabel")
	craftableItem.clear()
	#print(craftingPanel["selectedRecipe"])
	craftableItem.append((craftingPanel["selectedRecipe"]))
#	selectedRecipeName = 
	connect("button_up", self, "_craftItem", craftableItem)
	#print(craftableItem)
	#print(craftingPanel.selectedRecipe)
	pass


func _craftItem(craftableItem):
	print("Crafting: " + craftableItem)
