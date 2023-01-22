extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 100

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
		"recipe": ["check the fridge"]
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
export var customerOrder = "food" 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	customerOrder = get_randem_food();
	#print(customerOrder)
	pass

func _process(delta):
	move_coustomer()
	pass

func move_coustomer():
	velocity.x = speed
	velocity.y -= 0
	velocity = move_and_slide(velocity, Vector2.UP)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_randem_food():
	return foodData[randi() % (foodData.size() - 1)]

