extends Button


onready var statsPanel = get_node("/root/Main/Stats/Panel")
onready var this = get_node(".")

var isVisible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	this.connect("pressed", self, "_showHideStatsPanel")
	statsPanel.hide()
	pass # Replace with function body.


func _showHideStatsPanel():
	if !isVisible:
		statsPanel.show()
		isVisible = true
	else: 
		statsPanel.hide()
		isVisible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
