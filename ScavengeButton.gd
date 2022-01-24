extends Button


onready var progress = get_node("ColorRect")
onready var this = get_node(".")
onready var inventory = get_node("/root/Main/Inventory")
onready var player = get_node("/root/Main/Player")

onready var itemClass = preload("Items.gd")

var isActive = false

var debugSpeed = 100

var item

# Called when the node enters the scene tree for the first time.
func _ready():
	if (itemClass):
		item = itemClass.new()
	progress.rect_scale.x = 0
	progress.modulate = Color(1, 1, 1, 0)
	this.connect("pressed", self, "_onClick")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if isActive:
		_showProgress()
	if player.stats.energy == 0:
		print('You have no more energy!')
		isActive = false
	pass

func _showProgress():
	if progress.rect_scale.x <= 1:
		progress.rect_scale.x += (0.001 * debugSpeed)
		progress.modulate.a += (0.001 * debugSpeed)
	# once progress reaches 100%, trigger scavenge result and restart
	if progress.rect_scale.x >= 1:
		_scavengeSuccess()

		progress.rect_scale.x = 0
		progress.modulate.a = 0

func _onClick():
	print('Now scavenging...')
	isActive = true

func _scavengeSuccess():
	var newItem = _findRandomItem()
	print('You found a ', newItem.name)
	#inventory.add_child(newItem)
	inventory._addItem(newItem)
	#print(inventory.contents)
	player.stats.totalExp += 5
	player.stats.energy -= 1
	player._populateStats(player.stats)

func _findRandomItem():
	#var rangeLimit = items.size()
	var randomPick = rand_range(0, 1)
	var possibleFinds = []
	
	for i in item.resources:
		if item.resources[i].rarity > randomPick:
			possibleFinds.append(item.resources[i])
			
	var rangeLimit = possibleFinds.size()
	var itemChoice = floor(rand_range(0, rangeLimit))
	return possibleFinds[itemChoice]

	#return items[randomPick]
		
