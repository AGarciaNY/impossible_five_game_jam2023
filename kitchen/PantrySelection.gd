extends Control
var foodData
var inventory
onready var inventoryContainer = $Inventory/ScrollContainer/VBoxContainer

func _ready():
	foodData = get_node("/root/FoodData")
	inventory = get_node("/root/Inventory")

func occupyEmpty(item):
#	getting the rows of food
	var rows = inventoryContainer.get_children()
	var count = 0
	while count < rows.size():
		var row = rows[count]
		var rowChildIndex = 0
		while rowChildIndex < 3:
			var inventorySpaces = row.get_children()
			var inventorySpace = inventorySpaces[rowChildIndex]
			var hasTexture = is_instance_valid(inventorySpace.get_node('TextureRect').texture)
			if !hasTexture:
				inventorySpace.get_node('TextureRect').texture = load(item)
				return
			rowChildIndex += 1
		count += 1

func _on_Cold_Spegetti_button_down():
#	print(foodData.foodData)
	inventory.inventory.push_back("spagetti")
	occupyEmpty("res://jam assets/Foods/Food_Assets/94_spaghetti.png")
	print(inventory.inventory)
