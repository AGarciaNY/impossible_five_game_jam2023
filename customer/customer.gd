extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 100

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

var foodData = [
	"spagetti",
	"meatball",
	"bread",
	"garlic bread",
	"loaf bread",
	"gingerbread man",
	"steak",
	"cake",
	"egg",
]
export var customerOrder = "food" 

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

