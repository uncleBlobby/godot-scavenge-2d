extends Node

var isVisible = false

var recipes = {
	"Wooden Handle" : {
		name = "Wooden Handle",
		type = "Component",
		description = "Useful for making tools.",
		components = {
			itemOne = {
				name = "Stick",
				quantity = 2
			},
			itemTwo = {
				name = "Plant Fiber",
				quantity = 1
			}
		}
	},
	"Stone Axe Head" : {
		name = "Stone Axe Head",
		type = "Component",
		description = "Obviously required for an effective axe.",
		components = {
			itemOne = {
				name = "Stone",
				quantity = 1,
			},
			itemTwo = {
				name = "Flint",
				quantity = 1
			}
		}
	},
	"Wooden Axe" : {
		name = "Wooden Axe",
		type = "Tool",
		durability = 100,
		description = "Useful for harvesting resources (wood).",
		components = {
			itemOne = {
				name = "Wooden Handle",
				quantity = 1,
			},
			itemTwo = {
				name = "Stone Axe Head",
				quantity = 1,
			}
		}
	},
	"Flint Blade" : {
		name = "Flint Blade",
		type = "Component",
		description = "Used to craft knives and other tools.",
		components = {
			itemOne = {
				name = "Flint",
				quantity = 2
			}
		}
	},
	"Hunting Knife" : {
		name = "Hunting Knife",
		type = "Tool",
		durability = 100,
		description = "Useful for hunting, fishing, and crafting.",
		components = {
			itemOne = {
				name = "Wooden Handle",
				quantity = 1,
			},
			itemTwo = {
				name = "Flint Blade",
				quantity = 1,
			}
		}
	}
}

onready var recipeList = get_node("Panel/RecipeList")
onready var detailWindow = get_node("Panel/RecipeDetailWindow")
onready var detailWindowTitle = get_node("Panel/RecipeDetailWindow/RecipeDetailLabel")
onready var recipeComponentList = get_node("Panel/RecipeDetailWindow/RecipeComponentList")

export var selectedRecipe = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var counter = 0
	for item in recipes:
		recipeList.add_item(recipes[str(item)].name, null, true)
		recipeList.set_item_tooltip(counter, _parseComponentsForToolTip(recipes[str(item)]))
		counter += 1
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# TODO UPDATE RECIPE LIST DISPLAY
	if recipeList.is_anything_selected():
		recipeComponentList.clear()
		var selected = recipeList.get_selected_items()
		var recipeName = recipeList.get_item_text(selected[0])
		#print(recipeName)
		selectedRecipe = recipeName
		#print(selected[0])
		#detailWindowTitle.set_text(recipeList[recipeList.get_selected_items()])
		#print(recipeList.get_selected_items())
		detailWindowTitle.set_text(recipeName)
		#recipeComponentList.add_item(recipes[str(recipeName)].name, null, false)
		for component in recipes[str(recipeName)].components:
			recipeComponentList.add_item(recipes[str(recipeName)].components[component].name + ' x ' + str(recipes[str(recipeName)].components[component].quantity), null, false)
		#what happens here if I add a comment?
		pass

func _parseComponentsForToolTip(recipeItem):
	print("Recipe Name: " + recipeItem.name)
	print("Components: ")
	var outputString = ''
	for component in recipeItem.components:
		var componentString = "Component: %s, Quantity: %d\n" % [recipeItem.components[component].name, recipeItem.components[component].quantity]
		outputString = outputString + componentString

	print(outputString)
	return outputString

#func _appendComponentsToRecipeComponentList(recipeItem):
#	pass
