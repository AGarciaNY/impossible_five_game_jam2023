extends Control
var foodData
var inventory
onready var inventoryContainer = $Inventory/ScrollContainer/VBoxContainer

var foodMap = {
	"spagetti": "res://jam assets/Foods/Food_Assets/94_spaghetti.png",
	"meatball": "res://jam assets/Foods/Food_Assets/69_meatball.png",
	"bread": "res://jam assets/Foods/Food_Assets/08_bread_dish.png",
	"garlic bread": "res://jam assets/Foods/Food_Assets/48_garlicbread.png",
	"loaf bread": "res://jam assets/Foods/Food_Assets/65_loafbread.png",
	"gingerbread man": "res://jam assets/Foods/Food_Assets/52_gingerbreadman.png",
	"steak":"res://jam assets/Foods/Food_Assets/95_steak.png",
	"cake": "res://jam assets/Foods/Food_Assets/22_cheesecake.png",
	"egg": "res://jam assets/Foods/Food_Assets/41_eggsalad_bowl.png",
}

func _ready():
	foodData = get_node("/root/FoodData")
	inventory = get_node("/root/Inventory")

func populateInventory():
	var inventoryIndex = 0
	var inventorySize = inventory.inventory.size()
#	getting the rows of food
	var rows = inventoryContainer.get_children()
	var count = 0
	while count < rows.size():
		var row = rows[count]
		var rowChildIndex = 0
		while rowChildIndex < 3:
			if inventorySize > inventoryIndex:
				var foodName = inventory.inventory[inventoryIndex]
				var inventorySpaces = row.get_children()
				var inventorySpace = inventorySpaces[rowChildIndex]
				inventorySpace.get_node('TextureRect').texture = load(foodMap[foodName])
				inventoryIndex += 1
				rowChildIndex += 1
		count += 1

func _process(_delta):
	print("hi")
