extends Node

export(PackedScene) var customer_node
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$customerTimer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_customerTimer_timeout():
	print("hi")
	var mob = customer_node.instance()
	
	var mob_spawn_location = get_node("Path2D/MobSpawnLocation")
	mob_spawn_location.offset = randi()
	
	var direction = mob_spawn_location.rotation + PI / 2
	
	mob.position = mob_spawn_location.position
	
	direction += rand_range( -PI/4, PI/4)
	mob.rotation = direction
	
	var velocity = Vector2(rand_range(150,250), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)
