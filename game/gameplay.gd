extends Node

signal OrderInProgress
signal OrderFinished
var numberOfCustomer = 0
var currentCustomer = 0
var playerIsTakingOrder = false
var customerIsReadyToOrder = false
var arrayOfMusic
var score = 0


export(PackedScene) var customer_node
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playerReadyToTakeOrder = false

var allTheCustomers = []
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	arrayOfMusic = $NewCustomerSound.get_children()
	$customerTimer.start()
	pass # Replace with function body.

func _process(delta):
	if playerIsTakingOrder and customerIsReadyToOrder:
		$customerGetingFood/RichTextLabel.visible = true
	else:
		$customerGetingFood/RichTextLabel.visible = false
		
	if Input.is_action_just_pressed("take_order"):
		if playerIsTakingOrder and customerIsReadyToOrder:
			#print(allTheCustomers[currentCustomer].customerOrder)
			#remove_child(allTheCustomers[currentCustomer])
			var getCurrentCustomerOrder = allTheCustomers[currentCustomer].customerOrder
			$customerMenu.itemsOfFood = getCurrentCustomerOrder
			$customerMenu.visible = true
			var hasFood = get_node("customerMenu").hasCorrectFood
			if hasFood:
				score += 5
				get_node("customerMenu").give_order()
				remove_child(allTheCustomers[currentCustomer])
				currentCustomer += 1
				numberOfCustomer -= 1
				emit_signal("OrderFinished")
				$Goose.play()
				print(score)
			$GlassBottle.play()
			emit_signal("OrderInProgress")
		else:
			$BassStab.play()
			print("can't take order")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_customerTimer_timeout():
	if numberOfCustomer < 5:
		arrayOfMusic[randi() % arrayOfMusic.size() - 1].play()
		print("numberOfCustomer",numberOfCustomer)
		var mob = customer_node.instance()
		var mob_spawn_location = get_node("Path2D/MobSpawnLocation")
		mob_spawn_location.offset = 80
		mob.position = mob_spawn_location.position
		var velocity = Vector2(0, 200)
		add_child(mob)
		#$NewCustomer.play()
		
		allTheCustomers.push_back(mob)
		#print(allTheCustomers[0],mob.customerOrder)
		#remove_child(allTheCustomers[numberOfCustomer])
		numberOfCustomer += 1


func _on_Node_plyerTakingOrder():
	playerIsTakingOrder = true
	pass # Replace with function body.
	
func _on_Node_plyerNotTakingOrder():
	playerIsTakingOrder = false
	$customerMenu.visible = false
	pass # Replace with function body.

func _on_customerGetingFood_area_entered(area):
	customerIsReadyToOrder = true
	$Piano.play()
	pass # Replace with function body.

func _on_customerGetingFood_area_exited(area):
	customerIsReadyToOrder = false
	$customerMenu.visible = false
	pass # Replace with function body.

