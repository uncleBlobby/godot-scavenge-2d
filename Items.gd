extends Node

class_name items

export var resources = {
	"Stick" : {
		name = "Stick",
		description = "A small piece of wood.",
		quantity = 0,
		rarity = 1,
		consumable = false,
		craftable = true,
		sprite = "res://assets/sprites/item-placeholder.png",
	},
	"Stone" : {
		name = "Stone",
		description = "A small rock.",
		quantity = 0,
		rarity = 0.75,
		consumable = false,
		craftable = true,
		sprite = "res://assets/sprites/item-placeholder.png",
	},
	"Plant Fiber" : {
		name = "Plant Fiber",
		description = "A tuft of grass, useful for crafting.",
		quantity = 0,
		rarity = 0.55,
		consumable = false,
		craftable = true,
		sprite = "res://assets/sprites/item-placeholder.png",
	},
	"Berries" : {
		name = "Berries",
		description = "A handful of tasty berries.",
		quantity = 0,
		rarity = 0.33,
		consumable = true,
		craftable = true,
		sprite = "res://assets/sprites/item-placeholder.png",
	},
	"Flint" : {
		name = "Flint",
		description = "Useful for starting fires.",
		quantity = 0,
		rarity = 0.2,
		consumable = false,
		craftable = true,
		sprite = "res://assets/sprites/item-placeholder.png",
	},
	"{{ ITEM }}" : {
		name = "{{ ITEM }}",
		description = "A generic description of the thing.",
		quantity = 0,
		rarity = 1,     # rarity is the highest possible odds of being found.
		consumable = false,
		craftable = false,
		sprite = "res://assets/sprites/item-placeholder.png",
	},
}



