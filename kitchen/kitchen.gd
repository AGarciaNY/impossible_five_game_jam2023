extends Node

signal plyerTakingOrder
signal plyerNotTakingOrder

signal orderFinishedGetPoints

var takingCustomerOrder = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_playerReadyToTakeOrder_body_entered(body):
	emit_signal("plyerTakingOrder")
	$DiceRoll.play()
	pass # Replace with function body.


func _on_playerReadyToTakeOrder_area_exited(area):
	emit_signal("plyerNotTakingOrder")
	pass # Replace with function body.


func _on_Node_OrderInProgress():
	takingCustomerOrder = true
	pass # Replace with function body.
	

func _on_Node_OrderFinished():
	emit_signal("orderFinishedGetPoints")
