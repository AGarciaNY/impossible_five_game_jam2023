extends Node

signal plyerTakingOrder
signal plyerNotTakingOrder
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
	pass # Replace with function body.


func _on_playerReadyToTakeOrder_area_exited(area):
	emit_signal("plyerNotTakingOrder")
	pass # Replace with function body.
