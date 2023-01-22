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
export var recipeOfFood = ""
export var itemsOfFood = ""

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
		#foodData.push([key,get_node("/root/FoodData")[key]])
	randomize()
	print(get_randem_food(foodData))
	pass # Replace with function body.

func get_randem_food(obj):
	return foodData[randi() % (foodData.size() - 1)]
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Node_OrderInProgress():
	$foodName.text = "food: " + nameOfFood
	$price.text = "price: " + str(priceOfFood)
	$recipe.text = "recipe: " + recipeOfFood
	$items.text = itemsOfFood
	pass # Replace with function body.
