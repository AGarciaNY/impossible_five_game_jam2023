extends Node2D
onready var pantry = get_node("../CanvasLayer/PantrySelection")
onready var stove = get_node("../CanvasLayer/Cook Interface")

#Shows Pantry
func _on_Area2D_area_entered(_area):
	pantry.visible = true

#hide Pantry
func _on_Area2D_area_exited(_area):
	pantry.visible = false

func _on_CookArea_area_entered(_area):
	stove.populateInventory()
	stove.visible = true
	pass # Replace with function body.
