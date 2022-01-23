extends Node2D

onready var statWindow = get_node("/root/Main/Stats/Panel/StatWindow")

var stats = {
	totalExp = 0,
	level = 1,
	#expToNextLevel = _calculateExpToNextLevel(stats.level, stats.totalExp)
	energy = 100,
	maxEnergy = 100,
}

func _populateStats(stats):
	statWindow.clear()
	statWindow.add_item("Level: " + str(stats.level), null, true)
	statWindow.add_item("Exp: " + str(stats.totalExp), null, true)
	statWindow.add_item("Next Level: " + str(_calculateExpToNextLevel(stats.level, stats.totalExp)), null, true)
	statWindow.add_item("Energy: " + str(stats.energy) + " / " + str(stats.maxEnergy), null, true)

func _calculateExpToNextLevel(currentLevel, totalExp):
	var nextExpThresh = currentLevel * currentLevel * 100
	return nextExpThresh

func _levelUp(stats):
	if stats.totalExp >= _calculateExpToNextLevel(stats.level, stats.totalExp):
		print('should level up')
		_increaseEnergyOnLevelUp(stats)
		stats.level += 1


func _increaseEnergyOnLevelUp(stats):
	stats.energy += stats.level * 5
	stats.maxEnergy += stats.level * 5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_levelUp(stats)
	pass
