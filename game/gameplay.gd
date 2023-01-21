extends Node

var numberOfCustomer = 0

export(PackedScene) var customer_node
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$customerTimer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_customerTimer_timeout():
	if numberOfCustomer < 5:
		print("numberOfCustomer",numberOfCustomer)
		var mob = customer_node.instance()
		
		var mob_spawn_location = get_node("Path2D/MobSpawnLocation")
		
		mob_spawn_location.offset = randi() % 100
		
		mob.position = mob_spawn_location.position
		
		var velocity = Vector2(0, 200)
		
		
		add_child(mob)
		numberOfCustomer += 1
