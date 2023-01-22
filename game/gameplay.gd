extends Node

var numberOfCustomer = 0

var playerIsTakingOrder = false
var customerIsReadyToOrder = false

export(PackedScene) var customer_node
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playerReadyToTakeOrder = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$customerTimer.start()
	pass # Replace with function body.

func _process(delta):
	if playerIsTakingOrder and customerIsReadyToOrder:
		$RichTextLabel.visible = true
	else:
		$RichTextLabel.visible = false
		
	if Input.is_action_just_pressed("take_order"):
		if playerIsTakingOrder and customerIsReadyToOrder:
			print("ready")
		else:
			print("can't take order")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_customerTimer_timeout():
	if numberOfCustomer < 5:
		print("numberOfCustomer",numberOfCustomer)
		var mob = customer_node.instance()
		var mob_spawn_location = get_node("Path2D/MobSpawnLocation")
		mob_spawn_location.offset = 80
		mob.position = mob_spawn_location.position
		var velocity = Vector2(0, 200)
		add_child(mob)
		numberOfCustomer += 1


func _on_Node_plyerTakingOrder():
	playerIsTakingOrder = true
	pass # Replace with function body.
	
func _on_Node_plyerNotTakingOrder():
	playerIsTakingOrder = false
	pass # Replace with function body.

func _on_customerGetingFood_area_entered(area):
	customerIsReadyToOrder = true
	pass # Replace with function body.

func _on_customerGetingFood_area_exited(area):
	customerIsReadyToOrder = false
	pass # Replace with function body.
