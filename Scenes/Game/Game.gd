extends Node2D

const levels: Array = [
	preload("res://Scenes/Game/Levels/Level1.tscn"),
	preload("res://Scenes/Game/Levels/Level2.tscn")
]

var currentRoom: int = 0
var currentLevel

func _ready():
	initRoom()

func initRoom():
	addRoom(0)
	
func nextRoom():
	if isRoomEmpty():
		currentRoom+=1
		if has_node("Level"): remove_child($Level)
		addRoom(currentRoom)
		
func addRoom(roomNum):
	if (roomNum < len(levels)):
		currentLevel = levels[roomNum].instance()
		add_child(currentLevel)
	else:
		push_error("Tried to access a level that doesn't exist")
		
func isRoomEmpty():
	for node in ["Entities/PlayerA", "Entities/PlayerB"]:
		if currentLevel.has_node(node):
			if currentLevel.get_node(node).enabled:
				return false
	return true