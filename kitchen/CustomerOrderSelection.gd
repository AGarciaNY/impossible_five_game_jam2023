extends Control

var foodData = [
	{	
		"name": "energy spagetti" ,
		"menu price": 20,
		"expenses": 10,
		"ing": [
			"spagetti",
			"meatball"
		],
		"recipe": [
			"COOK",
			"COMBINE",
		],
	},
	 {
		"name": "nature steak",
		"menu price": 50,
		"expenses": 20,
		"ing": [
			"steak",
		],
		"recipe": [
			"COOK",
		],
	},
	{
		"name": "birthday cake",
		"menu price": 80,
		"expenses": 30,
		"ing": [
			"cake",
		],
		"recipe": []
	},
	{
		"name": "scream to bread",
		"menu price": 15,
		"expenses": 5,
		"ing": [
			"bread",
			"garlic bread",
			"gingermanbread",
			"loaf bread"
		],
		"recipe": [
			"COMBINE",
		],
	},
	{
		"name": "burger of the month",
		"menu price": 50,
		"expenses": 10,
		"ing": [
			"bread",
			"steak",
			"egg salad",
		],
		"recipe": [
			"COOK",
			"COMBINE",
		],
	}
]
export var nameOfFood = ""
export var priceOfFood = ""
export var itemsOfFood = ""
var hasCorrectFood = false

func inventoryHasItem(item):
	var inventory = get_node("/root/Inventory").inventory
	var count = 0
	while count < inventory.size():
		if inventory[count] == item:
			return true
		count += 1
	return false

func _ready():
		#foodData.push([key,get_node("/root/FoodData")[key]])
	randomize()
	print(get_randem_food(foodData))
	pass # Replace with function body.

func get_randem_food(obj):
	return foodData[randi() % (foodData.size() - 1)]

func _on_Node_OrderInProgress():
	$items.text = itemsOfFood
	if inventoryHasItem(itemsOfFood):
		hasCorrectFood = true

func give_order():
	var inventory = get_node("/root/Inventory").inventory
	var newInventory = []
	var count = 0
	var foundFood = false
	while count < inventory.size():
		if inventory[count] == itemsOfFood && !foundFood:
			foundFood = true
		else:
			newInventory.push_back(inventory[count])
		count += 1
	get_node("/root/Inventory").inventory = newInventory
	hasCorrectFood = false
